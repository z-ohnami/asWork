package work
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act004 extends Sprite
	{
		
		[Embed(source = '/img/hana.jpg', mimeType='image/jpeg')]
		private var ImageClass:Class;
		
		public function Act004()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			addImage();
		}
		
		private function addImage():void
		{
			var bitmap:Bitmap = new ImageClass() as Bitmap;
			addChild(bitmap);
		}
		
	}
}