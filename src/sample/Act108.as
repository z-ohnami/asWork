package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Act108 extends Sprite
	{
		private var _shape:Sprite = null;
		
		public function Act108()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			stage.color = 0x000000;
			drawRect(0x00FF00);
		}

		private function drawRect(color:uint):void
		{
			_shape = new Sprite();
			changeColor(0xFF0000);
			_shape.addEventListener(MouseEvent.CLICK, onChangeColor);
			_shape.x = (stage.stageWidth - _shape.width) / 2;
			_shape.y = (stage.stageHeight - _shape.height) / 2;
			addChild(_shape);
		}
		
		private function onChangeColor(event:Event):void
		{
			changeColor(0x0000FF);
		}

		private function changeColor(color:uint):void
		{
			_shape.graphics.clear();
			_shape.graphics.beginFill(color);
			_shape.graphics.drawRect(0,0,100,100);
			_shape.graphics.endFill();
			
		}
		
	}
}