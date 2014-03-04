package sample
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act104 extends Sprite
	{
		
		[Embed(source = '/img/hana.jpg', mimeType='image/jpeg')]
		private var ImageHana:Class;

		[Embed(source = '/img/daruma.jpg', mimeType='image/jpeg')]
		private var ImageDaruma:Class;
		
		public function Act104()
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
			addChild(bmpHana);

			var bmpDaruma:Bitmap = new ImageDaruma() as Bitmap;
			bmpDaruma.y = bmpHana.height;
			addChild(bmpDaruma);
		}
		
	}
}