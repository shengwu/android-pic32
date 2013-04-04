package lims.androidsensor.app;

import lims.androidsensor.server.AbstractServerListener;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;

/* 
 * Draw a purple rectangle where the user touches the screen;
 * draw an orange rectangle based on coordinates received
 * from the PIC. The PIC will move the orange rectangle
 * randomly whenever the purple rectangle is touched. 
 * 
 * This code is borrowed from the microbridge project
 * http://code.google.com/p/microbridge/
 */
public class TouchscreenView extends View implements OnTouchListener {

	private Paint borderPaint = new Paint();
	private Paint sensorPaint = new Paint();
	private Paint picPaint = new Paint();

	// Coordinates of touch
	private float sx, sy;
	
	// Coordinates that PIC sends
	private float px, py;
	
	// Identify data transmitted from this demo to the PIC
	private static final byte TOUCHSCREEN_ID = 0x0a;

	public TouchscreenView(Context context) {
		super(context);

		setFocusable(true);
		setFocusableInTouchMode(true);

		// White background
		borderPaint.setColor(Color.WHITE);
		borderPaint.setAntiAlias(true);
		borderPaint.setStyle(Style.FILL);

		// Use Northwestern's purple #520063 for user's touch
		sensorPaint.setColor(Color.rgb(0x52, 0x00, 0x63));
		sensorPaint.setStyle(Style.FILL);
		
		// Use orange for PIC's response
		picPaint.setColor(Color.rgb(255, 127, 0));
		picPaint.setStyle(Style.FILL);

		this.setOnTouchListener(this);
	}
	
	// Pass a function to process PIC data back to TouchscreenDemo
	public AbstractServerListener initializeServerListener() {
		// The PIC will send its own coordinates each time it receives data
		return new AbstractServerListener() {
			@Override
			public void onReceive(lims.androidsensor.server.Client client, final byte[] data) {
				// Extract the four-byte chunks
				// Arrays.copyOfRange requires API level 9 - can use that instead
				//  if the Android device runs 2.3 or above. 
				byte[] x = new byte[4];
				byte[] y = new byte[4];
				System.arraycopy(data, 0, x, 0, 4);
				System.arraycopy(data, 4, y, 0, 4);
				
				// Update position of orange box with coordinates from the PIC
				px = (int) (AndroidSensor.bytesToFloat(x) * TouchscreenView.this.getWidth());
				py = (int) (AndroidSensor.bytesToFloat(y) * TouchscreenView.this.getHeight());
			};
		};
	}

	@Override
	public void onDraw(Canvas canvas) {
		// Draw white background
		canvas.drawRect(this.getLeft(), this.getTop(), this.getRight(),
				this.getBottom(), borderPaint);
		
		// Draw colored box at location of touch
		canvas.drawRect(sx - 20, sy - 20, sx + 20, sy + 20, sensorPaint);
		
		// Draw colored box at location of PIC's coordinates
		canvas.drawRect(px - 20, py - 20, px + 20, py + 20, picPaint);

		// Draw coordinates below each colored box
		canvas.drawText("(" + Math.round(sx) + ", " + Math.round(sy) + ")", 
				sx - 20, sy + 32, sensorPaint);
		canvas.drawText("(" + Math.round(px) + ", " + Math.round(py) + ")", 
				px - 20, py + 32, picPaint);
	}

	public boolean onTouch(View v, MotionEvent event) {
		sx = event.getX();
		sy = event.getY();
		
		float x = sx / this.getWidth();
		float y = sy / this.getHeight();

		// Send coordinates of touch to the PIC32 as a float in range 0 to 1 
		// (to be independent of the device's resolution)
		AndroidSensor.send(AndroidSensor.concatAll(new byte[] {TOUCHSCREEN_ID},
				AndroidSensor.floatToBytes(x), 
				AndroidSensor.floatToBytes(y)));

		// Invokes a call to onDraw to refresh the screen
		invalidate();
		return true;
	}
}
