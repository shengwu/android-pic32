// Much of this code is borrowed from
// http://stackoverflow.com/questions/8401455/i-want-to-check-the-loudness-of-voice-in-android

package lims.androidsensor.app;

import lims.androidsensor.server.AbstractServerListener;
import lims.androidsensor.server.Server;
import android.app.Activity;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.ToggleButton;

/**
 * Access microphone data using AudioRecord.
 * 
 * The display bar shows maximum amplitude of the previous sample (i.e. loudness),
 * but the raw waveform data is available in an array of shorts.
 * 
 * The microphone data is written into a buffer, which is continuously read
 * in a background thread that calls readAudioData().
 */
public class MicrophoneDemo extends Activity {
	Server server;
	ToggleButton recordButton;
	TextView microphoneStatus;
	TextView picComment;
	ProgressBar levelBar;
	
	static final int sampleRate = 8000;
	private static final int bufferSizeFactor = 5;
	private AudioRecord audio;
	private int bufferSize;
	private Handler handler = new Handler();
	private int lastLevel = 0;
	
	// Time in milliseconds between each update of the level bar
	private int updateDelay = 80;
	
	// The multiplier that determines the rate of decay of the level
	// Smaller value = faster decay
	private float decayRate = 0.7f;

	// Identify data transmitted from this demo to the PIC
	private static final byte MIC_ID = 0x0b;
	
	// Scale shorts to bytes
	//private static final short DIVIDER = Short.MAX_VALUE / Byte.MAX_VALUE;
	
	// To hold bytes that are transmitted to PIC
	private static final int MAX_PIC_DATA = 100;
	byte[] picData = new byte[MAX_PIC_DATA];

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.microphone);
		
		recordButton = (ToggleButton) findViewById(R.id.recordButton);
		microphoneStatus = (TextView) findViewById(R.id.microphoneStatus);
		picComment = (TextView) findViewById(R.id.picComment);
		levelBar = (ProgressBar) findViewById(R.id.levelBar);
		
		// We're going to be setting the level bar directly from the microphone
		// with AudioRecord, which returns data as Short
		levelBar.setMax(Short.MAX_VALUE - 1);

		// Get the application's server and set it up with micListener
		ServerHolder serverHolder = ((ServerHolder) getApplicationContext());
		server = serverHolder.getServer();
		server.addListener(micListener);
		
		// Turn microphone on or off based on the state of @recordButton
		recordButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				if (recordButton.isChecked()) {
					// Configure and start AudioRecord functionality
					// with the most basic settings
					bufferSize = AudioRecord.getMinBufferSize(sampleRate,
							AudioFormat.CHANNEL_CONFIGURATION_MONO,
							AudioFormat.ENCODING_PCM_16BIT)
							* bufferSizeFactor;
					audio = new AudioRecord(MediaRecorder.AudioSource.MIC,
							sampleRate, AudioFormat.CHANNEL_CONFIGURATION_MONO,
							AudioFormat.ENCODING_PCM_16BIT, bufferSize);
					audio.startRecording();

					// Start reading the microphone data in the background
					Thread thread = new Thread(new Runnable() {
						public void run() {
							readAudioBuffer();
						}
					});
					thread.setPriority(Thread.currentThread().getThreadGroup().getMaxPriority());
					thread.start();
					
					// Stop any pending updates to the level bar
					// and start the update process again
					handler.removeCallbacks(updateLevel);
					handler.postDelayed(updateLevel, 25);
					microphoneStatus.setText("Microphone on");
				} else {
					// Release the resources used by the AudioRecord
					audio.stop();
					audio.release();
					audio = null;
					
					handler.removeCallbacks(updateLevel);
					microphoneStatus.setText("Idle");
				}
			}
		});		
	}

	private void readAudioBuffer() {
		try {
			short[] buffer = new short[bufferSize];
			int bufferReadResult;

			do {
				// Grab the raw audio data
				bufferReadResult = audio.read(buffer, 0, bufferSize);
				
				// Grab a sample up to MAX_PIC_DATA bytes in length
				// Scale shorts to bytes and send it to the PIC
				
				// This code had problems with signed bytes in Java vs. 
				// unsigned bytes on the PIC. Audio waveforms have
				// both positive and negative values, so it's not good 
				// to send unsigned bytes. It's probably best to do
				// processing in Android and then send the results. 
				
				//Arrays.fill(picData, (byte) 0x00);
				//int picDataLength = Math.min(MAX_PIC_DATA, bufferReadResult);
				//for (int i = 0; i < picDataLength; i++) {
				//	picData[i] = (byte) (buffer[i] / DIVIDER;
				//}
					
				// Grab the highest "amplitude" sample in buffer
				// to represent our volume level
				for (int i = 0; i < bufferReadResult; i++){
					if (buffer[i] > lastLevel) {
						lastLevel = buffer[i];
					}
				}
				
				// Send the max value to PIC
				AndroidSensor.send(AndroidSensor.concatAll(new byte[] {MIC_ID}, AndroidSensor.intToBytes(lastLevel)));
				
			} while (bufferReadResult > 0 && audio.getRecordingState() == AudioRecord.RECORDSTATE_RECORDING);
			

			if (audio != null) {
				audio.release();
				audio = null;
				handler.removeCallbacks(updateLevel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Update the level bar, decay it, and schedule a future update
	private Runnable updateLevel = new Runnable() {
		public void run() {
			levelBar.setProgress(lastLevel);
			lastLevel *= decayRate;
			handler.postAtTime(this, SystemClock.uptimeMillis() + updateDelay);
		}
	};
	
	// Handle data received from the PIC
	AbstractServerListener micListener = new AbstractServerListener() {
		@Override
		public void onReceive(lims.androidsensor.server.Client client, final byte[] data) {
			// Alternatively, you can use Handlers
			runOnUiThread(new Runnable() {
				@Override
				public void run() {
					picComment.setText(new String(data));
				}
			});
		};
	};

	@Override
	public void onDestroy() {
		super.onDestroy();
		
		// If it hasn't been released already, 
		// release our AudioRecord object to avoid crashing
		if (audio != null) {
			audio.stop();
			audio.release();
			audio = null;
		}
		
		// Remove this demo's listener
		server.removeListener(micListener);
	}
}
