package lims.androidsensor.app;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import lims.androidsensor.server.AbstractServerListener;
import lims.androidsensor.server.Server;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.format.Time;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;


/**
 * This file demonstrates how to use Android's LocationManager, which enables you
 * to determine the device's location with a LocationProvider such as the cell network
 * or the GPS radio. Although this is called "GPSDemo", most of the location updates
 * will be from wi-fi or the cell network.
 * 
 * You must have network data or wi-fi to retreive addresses.
 * 
 * Most of this code is from
 * http://developer.android.com/training/basics/location/currentlocation.html
 */
public class GPSDemo extends Activity {
	private Server server;

	private ToggleButton gpsGetLocation;
	private Button gpsSendLocation;
	private TextView gpsStatus;
	private TextView gpsLatitude;
	private TextView picLatitude;
	private TextView gpsLongitude;
	private TextView picLongitude;
	private TextView gpsAddress;
	private TextView picAddress;

	private Location previousLocation;
	private LocationManager mLocationManager;
	private static Handler mHandler;
	private boolean mGeocoderAvailable;

	private static final int UPDATE_LAT = 1;
	private static final int UPDATE_LNG = 2;
	private static final int UPDATE_ADDRESS = 3;
	private static final int UPDATE_STATUS = 4;
	private static final int UPDATE_PIC_LAT = 5;
	private static final int UPDATE_PIC_LNG = 6;
	private static final int UPDATE_PIC_ADDRESS = 7;

	private static final int TEN_SECONDS = 10000;
	private static final int TEN_METERS = 10;
	private static final int TWO_MINUTES = 1000 * 60 * 2;

	// Identify data transmitted from this demo to the PIC
	private static final byte GPS_ID = 0x08;

	@SuppressLint("NewApi")
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.gps);

		gpsGetLocation = (ToggleButton) findViewById(R.id.gpsGetLocation);
		gpsSendLocation = (Button) findViewById(R.id.gpsSendLocation);
		gpsStatus = (TextView) findViewById(R.id.gpsStatus);
		gpsLatitude = (TextView) findViewById(R.id.gpsLatitude);
		picLatitude = (TextView) findViewById(R.id.picLatitude);
		gpsLongitude = (TextView) findViewById(R.id.gpsLongitude);
		picLongitude = (TextView) findViewById(R.id.picLongitude);
		gpsAddress = (TextView) findViewById(R.id.gpsAddress);
		picAddress = (TextView) findViewById(R.id.picAddress);

		// Determine if the address service is available
		// The isPresent() helper method is only available on Gingerbread or above.
		mGeocoderAvailable =
				Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD && Geocoder.isPresent();

		// Handler for updating text fields on the UI like the lat/long and address.
		mHandler = new Handler() {
			public void handleMessage(Message msg) {
				switch (msg.what) {
				case UPDATE_LAT:
					gpsLatitude.setText((String) msg.obj);
					break;
				case UPDATE_LNG:
					gpsLongitude.setText((String) msg.obj);
					break;
				case UPDATE_ADDRESS:
					gpsAddress.setText((String) msg.obj);
					break;
				case UPDATE_STATUS:
					gpsStatus.setText((String) msg.obj);
					break;
				case UPDATE_PIC_LAT:
					picLatitude.setText((String) msg.obj);
					break;
				case UPDATE_PIC_LNG:
					picLongitude.setText((String) msg.obj);
					break;
				case UPDATE_PIC_ADDRESS:
					picAddress.setText((String) msg.obj);
					break;
				}
			}
		};

		// Get a reference to the LocationManager object.
		mLocationManager = (LocationManager) getSystemService(Context.LOCATION_SERVICE);

		// Get the application's server and set it up with gpsListener
		ServerHolder serverHolder = ((ServerHolder) getApplicationContext());
		server = serverHolder.getServer();
		server.addListener(gpsListener);

		gpsGetLocation.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// Start or stop acquiring location
				setup();
			}
		});

		// Send location data to the PIC32
		gpsSendLocation.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// Send latitude and longitude data identified by GPS_ID (total nine bytes)
				if (previousLocation != null) {
					AndroidSensor.send(AndroidSensor.concatAll(new byte[] {GPS_ID},
							AndroidSensor.floatToBytes((float) previousLocation.getLatitude()), 
							AndroidSensor.floatToBytes((float) previousLocation.getLongitude())));

				} else {
					gpsStatus.setText("Cannot send coordinates: no location available");
				}
			}
		});
	}
	
	// Handle data received from the PIC
	@SuppressLint("HandlerLeak")
	private AbstractServerListener gpsListener = new AbstractServerListener() {
		@Override
		public void onReceive(lims.androidsensor.server.Client client, final byte[] data) {
			// Expect 8 bytes from the PIC,
			// two floats representing the transformed coordinates
			byte[] new_lat = new byte[4];
			byte[] new_lng = new byte[4];
			System.arraycopy(data, 0, new_lat, 0, 4);
			System.arraycopy(data, 4, new_lng, 0, 4);
			float nlat = AndroidSensor.bytesToFloat(new_lat);
			float nlng = AndroidSensor.bytesToFloat(new_lng);
			
			// Display received coordinates
			Message.obtain(mHandler, UPDATE_PIC_LAT, Float.toString(nlat)).sendToTarget();
			Message.obtain(mHandler, UPDATE_PIC_LNG, Float.toString(nlng)).sendToTarget();
			
			Location l = new Location("PIC32");
			l.setLatitude((double) nlat);
			l.setLongitude((double) nlng);
			if (mGeocoderAvailable) doReverseGeocoding(l, true);
		};
	};

	// Stop receiving location updates whenever the Activity becomes invisible.
	@Override
	protected void onStop() {
		super.onStop();
		mLocationManager.removeUpdates(listener);
	}

	// Update location when resumed
	@Override
	protected void onResume() {
		super.onResume();
		setup();
	}

	// Remove the activity's server listener when exited
	@Override
	public void onDestroy() {
		super.onDestroy();
		server.removeListener(gpsListener);
	}

	// Set up fine and/or coarse location providers depending on whether the fine provider or
	// both providers button is pressed.
	private void setup() {
		Location gpsLocation = null;
		Location networkLocation = null;
		mLocationManager.removeUpdates(listener);

		if (gpsGetLocation.isChecked()) {
			// Request updates from both fine (gps) and coarse (network) providers.
			gpsLocation = requestUpdatesFromProvider(
					LocationManager.GPS_PROVIDER, R.string.gps_unavailable);
			networkLocation = requestUpdatesFromProvider(
					LocationManager.NETWORK_PROVIDER, R.string.network_unavailable);
		} else {
			Message.obtain(mHandler, UPDATE_STATUS, "Idle").sendToTarget();
		}

		// If both providers return last known locations, compare the two and use the better
		// one to update the UI.  If only one provider returns a location, use it.
		if (gpsLocation != null && networkLocation != null) {
			Location previousLocation = getBetterLocation(gpsLocation, networkLocation);
			updateUILocation(previousLocation);
		} else if (gpsLocation != null) {
			updateUILocation(gpsLocation);
			previousLocation = gpsLocation;
		} else if (networkLocation != null) {
			updateUILocation(networkLocation);
			previousLocation = networkLocation;
		}
	}

	/**
	 * Method to register location updates with a desired location provider.  If the requested
	 * provider is not available on the device, the app displays a Toast with a message referenced
	 * by a resource id.
	 *
	 * @param provider Name of the requested provider.
	 * @param errorResId Resource id for the string message to be displayed if the provider does
	 *                   not exist on the device.
	 * @return A previously returned {@link android.location.Location} from the requested provider,
	 *         if exists.
	 */
	private Location requestUpdatesFromProvider(final String provider, final int errorResId) {
		Location location = null;
		if (mLocationManager.isProviderEnabled(provider)) {
			mLocationManager.requestLocationUpdates(provider, TEN_SECONDS, TEN_METERS, listener);
			location = mLocationManager.getLastKnownLocation(provider);
		} else {
			Toast.makeText(this, errorResId, Toast.LENGTH_LONG).show();
		}
		return location;
	}

	// Perform desired actions when we get a new location
	private final LocationListener listener = new LocationListener() {

		@Override
		public void onLocationChanged(Location location) {
			// A new location update is received.  Do something useful with it.  Update the UI with
			// the location update.
			updateUILocation(location);
			
			// Update the location value that's sent to the PIC (if the send button is pressed)
			previousLocation = location;
		}

		@Override
		public void onProviderDisabled(String provider) {
		}

		@Override
		public void onProviderEnabled(String provider) {
		}

		@Override
		public void onStatusChanged(String provider, int status, Bundle extras) {
		}
	};

	// Update the display
	private void updateUILocation(Location location) {
		// We're sending the update to a handler, which updates the UI with the new location.
		Message.obtain(mHandler, UPDATE_LAT, Double.toString(location.getLatitude())).sendToTarget();
		Message.obtain(mHandler, UPDATE_LNG, Double.toString(location.getLongitude())).sendToTarget();

		// Update status with details of location
		String provider = location.getProvider();
		if (provider == null)
			provider = "unknown source";
		Time time = new Time();
		time.set(location.getTime());
		Message.obtain(mHandler, UPDATE_STATUS, "Displaying location retrieved at " + time.format("%r") + " from " + provider).sendToTarget();

		// Bypass reverse-geocoding only if the Geocoder service is available on the device.
		if (mGeocoderAvailable) doReverseGeocoding(location, false);
	}

	/** Determines whether one Location reading is better than the current Location fix.
	 * Code taken from
	 * http://developer.android.com/guide/topics/location/obtaining-user-location.html
	 *
	 * @param newLocation  The new Location that you want to evaluate
	 * @param currentBestLocation  The current Location fix, to which you want to compare the new
	 *        one
	 * @return The better Location object based on recency and accuracy.
	 */
	protected Location getBetterLocation(Location newLocation, Location currentBestLocation) {
		if (currentBestLocation == null) {
			// A new location is always better than no location
			return newLocation;
		}

		// Check whether the new location fix is newer or older
		long timeDelta = newLocation.getTime() - currentBestLocation.getTime();
		boolean isSignificantlyNewer = timeDelta > TWO_MINUTES;
		boolean isSignificantlyOlder = timeDelta < -TWO_MINUTES;
		boolean isNewer = timeDelta > 0;

		// If it's been more than two minutes since the current location, use the new location
		// because the user has likely moved.
		if (isSignificantlyNewer) {
			return newLocation;
			// If the new location is more than two minutes older, it must be worse
		} else if (isSignificantlyOlder) {
			return currentBestLocation;
		}

		// Check whether the new location fix is more or less accurate
		int accuracyDelta = (int) (newLocation.getAccuracy() - currentBestLocation.getAccuracy());
		boolean isLessAccurate = accuracyDelta > 0;
		boolean isMoreAccurate = accuracyDelta < 0;
		boolean isSignificantlyLessAccurate = accuracyDelta > 200;

		// Check if the old and new location are from the same provider
		boolean isFromSameProvider = isSameProvider(newLocation.getProvider(),
				currentBestLocation.getProvider());

		// Determine location quality using a combination of timeliness and accuracy
		if (isMoreAccurate) {
			return newLocation;
		} else if (isNewer && !isLessAccurate) {
			return newLocation;
		} else if (isNewer && !isSignificantlyLessAccurate && isFromSameProvider) {
			return newLocation;
		}
		return currentBestLocation;
	}

	// Check whether two providers are the same
	private boolean isSameProvider(String provider1, String provider2) {
		if (provider1 == null) {
			return provider2 == null;
		}
		return provider1.equals(provider2);
	}

	// Call the asynchronous ReverseGeocodingTask
	private void doReverseGeocoding(Location location, boolean forPic) {
		// Since the geocoding API is synchronous and may take a while.  You don't want to lock
		// up the UI thread.  Invoking reverse geocoding in an AsyncTask.
		if (forPic) {
			(new PicReverseGeocodingTask(this)).execute(new Location[] {location});
		} else {
			(new ReverseGeocodingTask(this)).execute(new Location[] {location});
		}
	}

	// AsyncTask encapsulating the reverse-geocoding API.  Since the geocoder API is blocked,
	// we do not want to invoke it from the UI thread.
	private class ReverseGeocodingTask extends AsyncTask<Location, Void, Void> {
		Context mContext;

		public ReverseGeocodingTask(Context context) {
			super();
			mContext = context;
		}

		@Override
		protected Void doInBackground(Location... params) {
			Geocoder geocoder = new Geocoder(mContext, Locale.getDefault());

			Location loc = params[0];
			List<Address> addresses = null;
			try {
				addresses = geocoder.getFromLocation(loc.getLatitude(), loc.getLongitude(), 1);
			} catch (IOException e) {
				e.printStackTrace();
				// Update address field with the exception.
				Message.obtain(mHandler, UPDATE_ADDRESS, "(error retrieving address)").sendToTarget();
			}
			if (addresses != null && addresses.size() > 0) {
				Address address = addresses.get(0);
				// Format the first line of address (if available), city, and country name.
				String addressText = String.format("%s\n%s, %s",
						address.getMaxAddressLineIndex() > 0 ? address.getAddressLine(0) : "",
								address.getLocality(),
								address.getCountryName());
				// Update address field on UI.
				Message.obtain(mHandler, UPDATE_ADDRESS, addressText).sendToTarget();
			}
			return null;
		}
	}
	
	// A version that updates the PIC's address field instead
	private class PicReverseGeocodingTask extends AsyncTask<Location, Void, Void> {
		Context mContext;

		public PicReverseGeocodingTask(Context context) {
			super();
			mContext = context;
		}

		@Override
		protected Void doInBackground(Location... params) {
			Geocoder geocoder = new Geocoder(mContext, Locale.getDefault());

			Location loc = params[0];
			List<Address> addresses = null;
			try {
				addresses = geocoder.getFromLocation(loc.getLatitude(), loc.getLongitude(), 1);
			} catch (IOException e) {
				e.printStackTrace();
				// Update address field with the exception.
				Message.obtain(mHandler, UPDATE_PIC_ADDRESS, "(error retrieving address)").sendToTarget();
			}
			if (addresses != null && addresses.size() > 0) {
				Address address = addresses.get(0);
				String stateName = address.getLocality();
				if (stateName == null) {
					stateName = "";
				} else {
					stateName += ", ";
				}
				// Format the first line of address (if available), city, and country name.
				String addressText = String.format("%s\n%s%s",
						address.getMaxAddressLineIndex() > 0 ? address.getAddressLine(0) : "",
								stateName,
								address.getCountryName());
				// Update address field on UI.
				Message.obtain(mHandler, UPDATE_PIC_ADDRESS, addressText).sendToTarget();
			}
			return null;
		}
	}
}
