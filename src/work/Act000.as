package work
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act000 extends Sprite
	{
		public function Act000()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function showText():void
		{

		}
		
	}
}