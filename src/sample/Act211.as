package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Act211 extends Sprite
	{
		private var _shape:Sprite = null;
		
		public function Act211()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
			stage.color = 0x000000;
			drawRect(0x00FF00);
		}

		private function drawRect(color:uint):void
		{
			_shape = new Sprite();
			changeColor(0xFF0000);
			_shape.addEventListener(MouseEvent.CLICK, onClick);
			_shape.x = (stage.stageWidth - _shape.width) / 2;
			_shape.y = (stage.stageHeight - _shape.height) / 2;
			addChild(_shape);
		}

		private function changeColor(color:uint):void
		{
			_shape.graphics.clear();
			_shape.graphics.beginFill(color);
			_shape.graphics.drawRect(0,0,100,100);
			_shape.graphics.endFill();
			
		}
		
		private function onClick(event:Event):void
		{
			openBrowser();
		}

		private function openBrowser():void
		{
			navigateToURL(new URLRequest('http://clockmaker.jp/blog/'));
		}
		
	}
}