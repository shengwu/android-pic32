package lims.stringpassing.app;

import java.io.IOException;

import lims.stringpassing.server.AbstractServerListener;
import lims.stringpassing.server.Client;
import lims.stringpassing.server.Server;
import android.app.Activity;
import android.os.Bundle;
import android.text.format.Time;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

/**
 * A single-activity application to send and receive strings. 
 */
public class StringPassing extends Activity {
	
	// Variables which with to access the buttons and text displays
	// described in res/layout/main.xml.
	private Server server;
	private Button sendButton;
	private Button clearButton;
	private EditText editText;
	private TextView receivedMessages;
	private TextView status;

	// onCreate is executed when the activity is started. 
	// To learn exactly when functions like "onCreate" are called, see
	// http://developer.android.com/reference/android/app/Activity.html#ActivityLifecycle
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		// Set our layout to main.xml
		setContentView(R.layout.main);

		// Link our variables with the buttons and text displays in main.xml
		sendButton = (Button) findViewById(R.id.button1);
		clearButton = (Button) findViewById(R.id.button2);
		editText = (EditText) findViewById(R.id.editText1);
		receivedMessages = (TextView) findViewById(R.id.textView3);
		status = (TextView) findViewById(R.id.status);
		
		// Enable scrolling for the received messages display
		receivedMessages.setMovementMethod(new ScrollingMovementMethod());

		// Create TCP server to listen for incoming ADB connections
		try {
			server = new Server(4545);
			server.start();
		} catch (IOException e) {
			Log.e("adbdemo", "Unable to start TCP server", e);
			System.exit(-1);
		}

		// Display strings received from the PIC32
		server.addListener(new AbstractServerListener() {
			@Override
			public void onReceive(Client client, final byte[] data) {
				if (data.length < 2)
					return;

				// Add the received bytes to the incoming messages display. 
				// TextView objects must be changed from the UI thread, so we must
				// pass a Runnable() instance to runOnUiThread in order to modify 
				// the text that @receivedMessages displays. 
				runOnUiThread(new Runnable() {
					public void run() {
						Time now = new Time();
						now.setToNow();
						receivedMessages.append(now.format("%I:%M:%S | ") + new String(data) + "\n");
					}
				});
			};

			// Update status message when the PIC is connected or disconnected.
			@Override
			public void onClientConnect(Server server, Client client) {
				runOnUiThread(new Runnable() {
					public void run() {
						status.setText("Connected");
					}
				});
			}
			
			// This doesn't seem to work. It's supposed to be called when the device disconnects.
			@Override
			public void onClientDisconnect(Server server, Client client) {
				runOnUiThread(new Runnable() {
					public void run() {
						status.setText("Disconnected");
					}
				});
			}
		});

		// Send message as bytes to the PIC when "Send to PIC" is pressed.
		sendButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				try {
					// Grab text from the editText field, convert it to bytes, and send it
					server.send(editText.getText().toString().getBytes());
				} catch (IOException e) {
					Log.e("adbdemo", "Problem sending TCP message", e);
				}
			}
		});

		// Reset the list of received messages to display (waiting for message)
		// when the user presses "Clear received messages"
		clearButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				receivedMessages.setText(getString(R.string.waitingMessage));
			}
		});
	}
	
	
	// Stop the server when the application is closed (when the 
	// back button is pressed). Otherwise, the application will crash
	// when restarted, when the new server tries to start another
	// thread to listen for connections. 
	
	// When the home button is pressed, the application is only paused, 
	// calling onPause(). If the user tries to start the Android Sensor
	// Demo app, the application will crash because the server from
	// this activity is still running. To avoid this, move the onDestroy()
	// code to onPause(), and add code to restart the server in onResume().
	@Override
	public void onDestroy() {
		super.onDestroy();
		server.stop();
	}
}