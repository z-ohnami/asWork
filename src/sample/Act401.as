package sample 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	
	public class Act401 extends Sprite 
	{
		
		public function Act401() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var text:TextField = new TextField(200,50,'test');
			text.text = 'Hello Starling';
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;

			addChild(text);
		}
		
	}

}