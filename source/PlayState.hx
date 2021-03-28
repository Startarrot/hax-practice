package;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		add(new FlxText(150, 200, 0, "Hello World!").setFormat("Times New Roman", 64));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
