package lims.androidsensor.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import lims.androidsensor.server.AbstractServerListener;
import lims.androidsensor.server.Server;
import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.hardware.Camera;
import android.os.Bundle;
import android.os.Environment;
import android.text.format.Time;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * In this demo, we access the camera directly through the framework API
 * to take a picture. It's button activated for this demo, but the code used
 * in captureImage's OnClickListener can be set to run intermittently 
 * for something like a mobile robot using image data for navigation. 
 * To confirm that the PIC32 received our image, the firmware that goes
 * with this application just inverts the image and sends it back. 
 * The inverted image is displayed in this application. 
 * 
 * This code saves the image as a .jpg first then reopens part of the image
 * as a bitmap. 
 * 
 * For a guide to using the camera like this, 
 * see http://developer.android.com/training/camera/cameradirect.html
 * 
 * To learn more about configuring the camera's settings, 
 * see http://developer.android.com/reference/android/hardware/Camera.Parameters.html
 * (An interesting method is public void getFocusDistances (float[] output),
 * which you could use to estimate the distance between the Android device
 * and the object at which the camera is looking.)
 */
public class CameraDemo extends Activity {
	
	private Server server;
	private Button captureImage;
	private TextView cameraStatus;
	private ImageView ourImage;
	private ImageView picImage;
	private SurfaceView previewSurface;
	private Preview myPreview;
	
	private static String imageFolder = "sensor_demo";
	private File capturedPhoto;

	// Identify data transmitted from this demo to the PIC
	private static final byte CAMERA_ID = 0x09;
	
	// Using a 40 by 30 image (640 by 480 divided by 16)
	private static final int NUM_IMAGE_PIXELS = 1200;
	private static final int REDUCTION_FACTOR = 16;
    
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.camera);
		
		captureImage = (Button) findViewById(R.id.captureImageButton);
		cameraStatus = (TextView) findViewById(R.id.cameraStatus);
		ourImage = (ImageView) findViewById(R.id.ourImage);
		picImage = (ImageView) findViewById(R.id.picImage);
		previewSurface = (SurfaceView) findViewById(R.id.cameraPreview);

		// Get the application's server and set it up with cameraListener
		ServerHolder serverHolder = ((ServerHolder) getApplicationContext());
		server = serverHolder.getServer();
		server.addListener(cameraListener);

		// Create image save directory if it doesn't exist
		File saveDirectory = new File(Environment.getExternalStorageDirectory().getPath() 
				+ File.separator + imageFolder);
		if (!saveDirectory.isDirectory())
			saveDirectory.mkdirs();
		
		// Initialize preview surface
		SurfaceHolder previewHolder = previewSurface.getHolder();
		myPreview = new Preview(this);
		previewHolder.addCallback(myPreview);
		previewHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);

		// Record image when "Capture image" button is pressed
		captureImage.setOnClickListener(captureImageListener);
	}

	// Handle data received from the PIC
	private AbstractServerListener cameraListener = new AbstractServerListener() {
		@Override
		public void onReceive(lims.androidsensor.server.Client client, final byte[] data) {
			// Display received bytes as a 40 by 30 bitmap image
			// Reserve a bitmap for construction the image from the RGB bytes
			final Bitmap inverted = Bitmap.createBitmap(40, 30, Bitmap.Config.ARGB_8888);
			int[] pixels = new int[NUM_IMAGE_PIXELS];
			for (int i = 0; i < NUM_IMAGE_PIXELS; i++) {
				// Read in RGB bytes and set alpha value
				// The four-byte layout is alpha, red, green, blue
				pixels[i] = (int) 0xff << 24 | ((int) data[i*3] << 16) | ((int) data[i*3+1] << 8) | ((int) data[i*3+2]);
			}
			inverted.setPixels(pixels, 0, 40, 0, 0, 40, 30);
			runOnUiThread(new Runnable() {
				@Override
				public void run() {
					picImage.setImageBitmap(inverted);
					cameraStatus.setText("Displaying data received from PIC.");
				}
			});
		};
	};

	// Remove this demo's listener when closed
	@Override
	public void onDestroy() {
		super.onDestroy();
		server.removeListener(cameraListener);
	}
	
	// Executed when "Capture image" button is pressed
	View.OnClickListener captureImageListener = new View.OnClickListener() {
		@Override
		public void onClick(View v) {
			cameraStatus.setText("Capturing image...");
			
			// Save file named with current date and time
			Time now = new Time();
			now.setToNow();
			String saveName = now.format("%F %H-%M-%S") + ".jpg"; // Google "man strftime" to change format
			
			// Designate a file in which to store the captured photo
			capturedPhoto = new File(Environment.getExternalStorageDirectory().getAbsolutePath() 
					+ File.separator + imageFolder, saveName);
			
			try {
				capturedPhoto.createNewFile();
				// Capture the image using the Preview class, 
				// passing @capturePhoto where the image will be saved
				if (myPreview.captureImage(capturedPhoto, CameraDemo.this)) {
					cameraStatus.setText("File saved as " + saveName);
				}
			} catch (IOException e) {
				Log.e(AndroidSensor.TAG, "photo capture I/O error");
				e.printStackTrace();
				cameraStatus.setText("photo capture I/O error");
			}
		}
	};
	
	public void sendImage(File photo) {
		// Reduce dimensions when opening image (by a factor of @REDUCTION_FACTOR)
		BitmapFactory.Options options = new BitmapFactory.Options();
		options.inSampleSize = REDUCTION_FACTOR;
		
		Bitmap crop = BitmapFactory.decodeFile(photo.getAbsolutePath(), options);
		
		// Display our bitmap
		ourImage.setImageBitmap(crop);
		
		// Extract pixel data from the bitmap
		int[] pixels = new int[NUM_IMAGE_PIXELS];
		crop.getPixels(pixels, 0, 40, 0, 0, 40, 30);
		byte[] rgbPixels = new byte[NUM_IMAGE_PIXELS * 3];
		
		// Extract red, green, and blue values from each 4-byte int
		// (Ignore the alpha channel)
		for (int i = 0; i < NUM_IMAGE_PIXELS; i++) {
			rgbPixels[i*3] = (byte) (pixels[i] << 16 & 0xff);
			rgbPixels[i*3+1] = (byte) (pixels[i] << 8 & 0xff);
			rgbPixels[i*3+2] = (byte) (pixels[i] & 0xff);
		}
		
		// Send data to PIC
		AndroidSensor.send(AndroidSensor.concatAll(new byte[] {CAMERA_ID}, rgbPixels));
		cameraStatus.setText("Image sent to PIC");
	}
}

// Initialize the preview surface - the live box that shows what the camera sees
// This class also initializes the camera. 
class Preview extends SurfaceView implements SurfaceHolder.Callback {
	
    SurfaceHolder mHolder;
    Camera mCamera;
    
    Preview(Context context) {
        super(context);
        
        // Install a SurfaceHolder.Callback so we get notified when the
        // underlying surface is created and destroyed.
        mHolder = getHolder();
        mHolder.addCallback(this);
        mHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
    }

    public void surfaceCreated(SurfaceHolder holder) {
        // The Surface has been created, acquire the camera and tell it where
        // to draw.
        mCamera = Camera.open();
        try {
           mCamera.setPreviewDisplay(holder);
        } catch (IOException exception) {
            mCamera.release();
            mCamera = null;
        }
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
        // Surface will be destroyed when we return, so stop the preview.
        // Because the CameraDevice object is not a shared resource, it's very
        // important to release it when the activity is paused.
        mCamera.stopPreview();
        mCamera.release();
        mCamera = null;
    }

    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        // Now that the size is known, set up the camera parameters and begin
        // the preview.
        Camera.Parameters parameters = mCamera.getParameters();
        
        // use the default preview size supported by this device
        List<Camera.Size> previewSizes = parameters.getSupportedPreviewSizes();
        Camera.Size previewSize = previewSizes.get(1);
        parameters.setPreviewSize(previewSize.width, previewSize.height);
        
        // want a high-quality, small image
        parameters.setJpegQuality(95);
        parameters.setPictureSize(640, 480);
		
        mCamera.setParameters(parameters);
        mCamera.setDisplayOrientation(90); // correct preview rotation
        mCamera.startPreview();
    }
    
    // Take a picture. The fourth argument (a PictureCallback) is called
    // when the data is ready to be written as a jpg. 
    public boolean captureImage(final File saveFile, final CameraDemo c) {
    	mCamera.takePicture(null, null, null, new Camera.PictureCallback() {
    		@Override
    		public void onPictureTaken(byte[] data, Camera camera) {
    			FileOutputStream file_saver;
    			try {
    				file_saver = new FileOutputStream(saveFile.getPath());
    				file_saver.write(data);
    				file_saver.close();
    				c.sendImage(saveFile);
    			}  catch (IOException e) {
    				Log.e(AndroidSensor.TAG, "Error writing image to file");
    			}
    		}
    	});
    	
    	return true;
    }

}
