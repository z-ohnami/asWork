package sample
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Act011 extends Sprite
	{
		private var _shape:Shikaku = null;
		private var timer:Timer;
		private var _currentColorPos:int = -1;
		private var _colorGroupLength:int = 0;
		
		private var _colorGroup:Array = [
			0xFF0000,
			0x00FF00,
			0x0000FF
		];
		
		public function Act011()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, initalize);

			_colorGroupLength = _colorGroup.length;
			
			timer = new Timer(2000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function initalize(event:Event):void
		{
			trace('application initialized.');
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			stage.color = 0x000000;
			drawRect(getShapeColor());
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
				_shape.dispatchEvent(new DataEvent(Shikaku.EVENT_MOVE,false,false,String(getShapeColor())));
		}

		private function getShapeColor():uint
		{
			if (_currentColorPos >= 0 && _currentColorPos < (_colorGroupLength - 1))
				_currentColorPos += 1;
			else
				_currentColorPos = 0;
				
			return _colorGroup[_currentColorPos];
		}
		
	}	
}

import flash.display.Shape;
import flash.events.Event;
import flash.events.DataEvent;

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
		changeColor(_color);
	}
	
	private function onMove(event:DataEvent):void
	{
		trace('event accepted.');
		move();
		changeColor(uint(event.data));
	}
	
	private function move():void
	{
		x += 10;
		y += 10;
	}
	
	private function changeColor(color:uint):void
	{
		_color = color;
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRect(0,0,100,100);
		graphics.endFill();
		trace('color changed !! ' + color);		
	}
}
