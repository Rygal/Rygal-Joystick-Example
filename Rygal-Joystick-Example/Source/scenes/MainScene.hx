package scenes;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;
import org.rygal.graphic.Color;
import org.rygal.graphic.Font;

import org.rygal.input.Mouse;

import org.rygal.input.Joystick;
import org.rygal.input.JoystickEvent;
import org.rygal.input.JoystickDeviceManager;

/**
* ...
* @author Christopher Kaster
*/

class MainScene extends Scene {

	public var _x:Float;
	public var _y:Float;
	public var _z:Float;
	
	public var device:Int;
	public var id:Int;

	private var font:Font;

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);

		font = Font.fromAssets("assets/nokiafc22.ttf", 8);
		
		game.joystick.addEventListener(JoystickEvent.AXIS_MOVE, onAxisMove);
	}

	public function onAxisMove(e:JoystickEvent) {
		_x = e.x;
	}

	override public function unload():Void {
		super.unload();

		// Unregister event listeners here, remove event listeners here.
	}

	override public function update(time:GameTime):Void {
		super.update(time);

	}
	
	override public function draw(screen:Canvas):Void {
		screen.clear();
		super.draw(screen);

		screen.drawString(font, "X: " + _x, Color.BLACK, 10, 10);
	}

}