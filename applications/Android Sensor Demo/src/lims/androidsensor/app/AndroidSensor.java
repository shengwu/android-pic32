package lims.androidsensor.app;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import lims.androidsensor.server.Server;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

/*
 * This application demonstrates the use of four different sensors
 * available on an Android device: the GPS/location services,
 * the camera, the touch screen, and the microphone. 
 * 
 * This Activity describes the menu that is presented when the application 
 * begins. It transfers the user to the appropriate demo when a button is pressed. 
 * 
 * The layout is found in res/layout/main.xml
 */
public class AndroidSensor extends Activity {
	
	private static Server server;
	private ServerHolder serverHolder;
	
	private Button gpsButton;
	private Button cameraButton;
	private Button touchscreenButton;
	private Button microphoneButton;

	public final static String TAG = "sensordemo";
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		gpsButton = (Button) findViewById(R.id.gpsButton);
		cameraButton = (Button) findViewById(R.id.cameraButton);
		touchscreenButton = (Button) findViewById(R.id.touchscreenButton);
		microphoneButton = (Button) findViewById(R.id.microphoneButton);
		
		// Start a server that will function for all of the 
		// Each sensor activity will add its own AbstractServerListener
		// for receiving data from the PIC. Each activity will 
		// remove its listener when exited. 
		serverHolder = ((ServerHolder) getApplicationContext());
		server = new Server(4545);
		try {
			server.start();
		} catch (IOException e) {
			Log.e(AndroidSensor.TAG, "Unable to start TCP server", e);
			System.exit(-1);
		}
		serverHolder.setServer(server);
		
		// Refer to the current Activity in a final variable
		final Activity thisActivity = this;

		// Open GPS activity
		gpsButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(thisActivity, GPSDemo.class);
				startActivity(intent);
			}
		});
		
		// Open camera activity
		cameraButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(thisActivity, CameraDemo.class);
				startActivity(intent);
			}
		});
		
		// Open touchscreen activity
		touchscreenButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(thisActivity, TouchscreenDemo.class);
				startActivity(intent);
			}
		});
		
		// Open microphone activity
		microphoneButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(thisActivity, MicrophoneDemo.class);
				startActivity(intent);
			}
		});
	}
	
	// Stop the server when activity is closed
	@Override
	public void onDestroy() {
		super.onDestroy();
		Server s = serverHolder.getServer();
		s.stop();
	}
	
	// A public function to send data to the PIC.
	// Each of the sensor demos can use this by calling
	// AndroidSensor.send({data_here})
	public static void send(byte[] b) {
		try {
			server.send(b);
		} catch (IOException e) {
			Log.e(AndroidSensor.TAG, "Error transmitting data to the PIC32", e);
		}
	}
	
	// The following functions are utility functions
	// for each of the sensor demos to use. 
	// =============================================
	
	// Convert a float to an array of bytes
	// Microchip's C32 compiler uses the little-endian format and
	// ByteBuffer defaults to big-endian, which is why
	// we call b.order(ByteOrder.LITTLE_ENDIAN) before
	// storing the float in the ByteBuffer. 
	public static final byte[] floatToBytes(Float f) {
		ByteBuffer b = ByteBuffer.allocate(4);
		return b.order(ByteOrder.LITTLE_ENDIAN).putFloat(f).array();
	}
	
	// Convert an array of bytes to a float
	public static final float bytesToFloat(byte[] array) {
		ByteBuffer b = ByteBuffer.wrap(array, 0, 4);
		return b.order(ByteOrder.LITTLE_ENDIAN).getFloat();
	}
	
	// Convert an int to an array of bytes
	public static final byte[] intToBytes(int i) {
		ByteBuffer b = ByteBuffer.allocate(4);
		return b.order(ByteOrder.LITTLE_ENDIAN).putInt(i).array();
	}
	
	// Convert an array of bytes to a float
	public static final int bytesToInt(byte[] array) {
		ByteBuffer b = ByteBuffer.wrap(array, 0, 4);
		return b.order(ByteOrder.LITTLE_ENDIAN).getInt();
	}
	
	/**
	 * Concatenate arrays of bytes,
	 * modified from 
	 * http://stackoverflow.com/questions/80476/how-to-concatenate-two-arrays-in-java
	 */	
	public static final byte[] concatAll(byte[]... arrays) {
		int totalLength = 0;
		for (byte[] array : arrays) {
			totalLength += array.length;
		}
		byte[] result = new byte[totalLength];
		int offset = 0;
		for (byte[] array : arrays) {
			System.arraycopy(array, 0, result, offset, array.length);
			offset += array.length;
		}
		return result;
	}
}