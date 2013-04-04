package lims.androidsensor.app;

import lims.androidsensor.server.Server;
import android.app.Application;

/* 
 * This class wraps a Server instance that is shared with each
 * individual sensor Activity. By specifying this class in
 * AndroidManifest.xml, Android will make this available for 
 * the entire application. We didn't do this for the String
 * Passing demo because that application was only a single activity.
 * 
 * This way, we can use a single server instance for all four
 * sensor demo activities. 
 */
public class ServerHolder extends Application {
	
	private Server server;
	
	public Server getServer() {
		return server;
	}
	
	public void setServer(Server s) {
		server = s;
	}
}