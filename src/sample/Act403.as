package sample 
{
	
	
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class Act403 extends Sprite 
	{

		[Embed(source = '/img/hana.jpg', mimeType='image/jpeg')]
		private static const ImageHana:Class;
		
		[Embed(source = '/img/daruma.jpg', mimeType='image/jpeg')]
		private static const ImageDaruma:Class;
		
		private var _shape:Sprite;
		
		public function Act403() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.color = 0x000000;
			addImage();
			
		}

		private function addImage():void
		{
			var bmpHana:Bitmap = new ImageHana() as Bitmap;
			var textureHana:Texture = Texture.fromBitmap(bmpHana);
			var imageHana:Image = new Image(textureHana);
			addChild(imageHana);

			
			var bmpDaruma:Bitmap = new ImageDaruma() as Bitmap;
			var textureDaruma:Texture = Texture.fromBitmap(bmpDaruma);
			var imageDaruma:Image = new Image(textureDaruma);
			imageDaruma.y = imageHana.height;
			addChild(imageDaruma);
			
		}
		

		
	}

}