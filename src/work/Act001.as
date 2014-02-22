package work
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act001 extends Sprite
	{
		public function Act001()
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

		}
		
	}
}