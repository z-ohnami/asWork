package sample
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Act110 extends Sprite
	{
		private var _shape:Shikaku = null;
		private var timer:Timer;
		
		public function Act110()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, initalize);

			timer = new Timer(2000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function initalize(event:Event):void
		{
			trace('application initialized.');
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			stage.color = 0x000000;
			drawRect(0x00FF00);
		}

		private function drawRect(color:uint):void
		{
			_shape = new Shikaku(color);
			_shape.x = 20;
			_shape.y = 20;
			addChild(_shape);
		}

		private function onTimer(TimerEvent:Event):void
		{
			if (_shape)
				_shape.dispatchEvent(new Event(Shikaku.EVENT_MOVE));
		}

	}	
}

import flash.display.Shape;
import flash.events.Event;

internal class Shikaku extends Shape
{
	public static const EVENT_MOVE:String = 'shikaku_event_move';
	private var _color:uint;
	
	public function Shikaku(color:uint):void
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, initialize);
		addEventListener(EVENT_MOVE, onMove);
		_color = color;
	}
	
	private function initialize(event:Event):void
	{
		graphics.beginFill(_color);
		graphics.drawRect(0,0,100,100);
		graphics.endFill();
	}
	
	private function onMove(Event:Event):void
	{
		trace('event accepted.');
		move();
	}
	
	private function move():void
	{
		x += 10;
		y += 10;
	}
}
