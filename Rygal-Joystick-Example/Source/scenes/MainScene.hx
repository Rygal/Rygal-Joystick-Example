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
import org.rygal.graphic.Texture;

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
	private var texture:Texture;

	private var buttons:IntHash<Int>;

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);

		font = Font.fromAssets("assets/nokiafc22.ttf", 8);
		texture = Texture.fromAssets("assets/megusta.png");
		
		buttons = new IntHash<Int>();

		// register events		
		game.joystick.addEventListener(JoystickEvent.AXIS_MOVE, onAxisMove);
		game.joystick.addEventListener(JoystickEvent.BUTTON_DOWN, onButtonDown);
		game.joystick.addEventListener(JoystickEvent.BUTTON_UP, onButtonUp);
		game.joystick.addEventListener(JoystickEvent.HAT_MOVE, onHatMove);
	}

	public function onAxisMove(e:JoystickEvent) {
		id = e.id;
		_x = e.x;
		_y = e.y;
	}
	
	public function onHatMove(e:JoystickEvent) {
		id = e.id;
		_x = e.x;
		_y = e.y;
	}
	
	public function onButtonDown(e:JoystickEvent) {
		buttons.set(e.id, e.id);
	}
	
	public function onButtonUp(e:JoystickEvent) {
		buttons.remove(e.id);
	}

	override public function unload():Void {
		super.unload();
	}

	override public function update(time:GameTime):Void {
		super.update(time);

		if(game.hasDevice(Joystick, 0)) {
			if(game.getDevice(Joystick, 0).isButtonPressed(11)) { // This "11" is A on the Xbox 360 gamepad
				trace("Button 11 pressed! :D");
			}
		}
	
	}
	
	override public function draw(screen:Canvas):Void {
		screen.clear();
		super.draw(screen);

		screen.fillRect(0xFF000000, 0, 0, game.width, game.height);

		var posX:Float = (game.width/2 - texture.width/2) + _x * 100;
		var posY:Float = (game.height/2 - texture.height/2) + _y * 100;

		screen.draw(texture, posX, posY);

		screen.drawString(font, "ID: " + id, Color.WHITE, 10, 10);
		screen.drawString(font, "X: " + _x, Color.WHITE, 10, 20);
		screen.drawString(font, "Y: " + _y, Color.WHITE, 10, 30);
		screen.drawString(font, "Buttons pressed:", Color.WHITE, 10, 50);
		
		var i:Int = 60;
		
		for(b in buttons) {
			screen.drawString(font, "Button: " + b, Color.WHITE, 10, i);
			i += 10;
		}
	}

}