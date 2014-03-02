package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class Act101 extends Sprite
	{
		public function Act101()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			showText();
		}
		
		private function showText():void
		{
			var text:TextField = new TextField();
			text.text = 'MAKOTO OHNAMI';
			text.width = 200;
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;
			addChild(text);
		}
		
	}
}