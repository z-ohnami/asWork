package sample
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act105 extends Sprite
	{
		
		[Embed(source = '/img/hana.jpg', mimeType='image/jpeg')]
		private var ImageHana:Class;

		[Embed(source = '/img/daruma.jpg', mimeType='image/jpeg')]
		private var ImageDaruma:Class;
		
		public function Act105()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
			addImage();
		}

		private function addImage():void
		{
			var bmpHana:Bitmap = new ImageHana() as Bitmap;
			bmpHana.scaleX = 3;
			bmpHana.scaleY = 3;
			addChild(bmpHana);

			var bmpDaruma:Bitmap = new ImageDaruma() as Bitmap;
			bmpDaruma.y = bmpHana.height;
			bmpDaruma.x = bmpDaruma.height;
			bmpDaruma.rotation = 90;
			addChild(bmpDaruma);
		}
		
	}
}