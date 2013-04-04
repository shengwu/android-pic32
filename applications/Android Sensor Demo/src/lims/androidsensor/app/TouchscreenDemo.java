package lims.androidsensor.app;

import lims.androidsensor.server.AbstractServerListener;
import lims.androidsensor.server.Server;
import android.app.Activity;
import android.os.Bundle;

/**
 * This class sets things up for TouchscreenView, which
 * does the heavy lifting for this demo. 
 */
public class TouchscreenDemo extends Activity {
	Server server;
	AbstractServerListener tsListener;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		TouchscreenView touchscreen = new TouchscreenView(this);
		
		// Since the server listener needs to manipulate variables in TouchscreenView,
		// we use a function to initialize it there and pass it back to us. 
		tsListener = touchscreen.initializeServerListener();

		// Get the application's server and set it up with tsListener
		ServerHolder serverHolder = ((ServerHolder) getApplicationContext());
		server = serverHolder.getServer();
		server.addListener(tsListener);

		// Start the actual demo screen
		setContentView(touchscreen);
		touchscreen.requestFocus();
	}

	// Remove tsListener when the demo is closed
	@Override
	public void onDestroy() {
		super.onDestroy();
		server.removeListener(tsListener);
	}
}
