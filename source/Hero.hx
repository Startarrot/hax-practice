package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Hero extends FlxSprite
{
	// How fast Hero moves
	static inline var SPEED:Float = 50;

	var hue:Float = 0;

	// Create Hero
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);

		makeGraphic(20, 20, FlxColor.WHITE);
	}

	// Gets user input to move
	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
		{
			up = down = false;
		}
		if (left && right)
		{
			left = right = false;
		}

		if (up || down || left || right)
		{
			var newAngle:Float = 0;

			if (up)
			{
				newAngle = -90;
				if (left)
				{
					newAngle -= 45;
				}
				else if (right)
				{
					newAngle += 45;
				}
			}
			else if (down)
			{
				newAngle = 90;

				if (left)
				{
					newAngle += 45;
				}
				else if (right)
				{
					newAngle -= 45;
				}
			}
			else if (left)
			{
				newAngle = 180;
			}
			else if (right)
			{
				newAngle = 0;
			}

			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
		}
	}

	override public function update(elapsed:Float)
	{
		updateMovement();

		hue = this.x + this.y;
		if (hue > 360)
		{
			hue -= 360;
		}
		if (hue < 0)
		{
			hue += 360;
		}
		this.color = FlxColor.fromHSB(Std.int(hue), 1, 1);

		super.update(elapsed);
	}
}
