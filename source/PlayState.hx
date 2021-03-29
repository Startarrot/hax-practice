package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var hero:Hero;
	var hue:Float = 0;

	override public function create()
	{
		// Create hello world
		add(new FlxText(150, 200, 0, "Hello World!").setFormat("Times New Roman", 64));

		// Create hero
		hero = new Hero(200, 200);
		add(hero);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		hue = hero.x + hero.y;
		if (hue > 360)
		{
			hue -= 360;
		}
		if (hue < 0)
		{
			hue += 360;
		}
		var color = FlxColor.fromHSB(Std.int(hue), 1, 1);
		hero.color = color;

		super.update(elapsed);
	}
}
