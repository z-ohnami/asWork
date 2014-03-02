package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class Act106 extends Sprite
	{
		
		public function Act106()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			showTime();
		}

		private function showTime():void
		{
			
			var date:Date = new Date();
			var timeText:String = date.hours + ':' + date.minutes + ':' + date.seconds;
			
			var text:TextField = new TextField();
			text.text = timeText;
			text.width = 200;
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;
			addChild(text);
		}
		
	}
}