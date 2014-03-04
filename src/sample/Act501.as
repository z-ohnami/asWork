package sample
{
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Act501 extends Sprite
	{
		private var _shape:Shikaku = null;
		
		public function Act501()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			trace('application initialized.');
			removeEventListener(Event.ADDED_TO_STAGE,init);
			stage.color = 0x000000;
			drawRect(0x00FF00);
		}

		private function drawRect(color:uint):void
		{
			_shape = new Shikaku(color);
			_shape.x = 0;
			_shape.y = 0;
			addChild(_shape);
		}

	}	
}

import a24.tween.Tween24;
import starling.display.Shape;
import starling.events.Event;

internal class Shikaku extends Shape
{
	private var _color:uint;
	
	public function Shikaku(color:uint):void
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		_color = color;
	}
	
	private function init(event:Event):void
	{
		graphics.beginFill(_color);
		graphics.drawRect(0,0,100,100);
		graphics.endFill();
		
		Tween24.tween(this,3).$xy(300,300).play();
		
	}
	
}
