package sample 
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import flash.utils.ByteArray;
	
	public class Act405 extends Sprite 
	{

		[Embed(source = '/img/hana.atf', mimeType='application/octet-stream')]
		private static const ImageHana:Class;
		
		[Embed(source = '/img/daruma.atf', mimeType='application/octet-stream')]
		private static const ImageDaruma:Class;
		
		
		public function Act405() 
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
			var bmpHana:ByteArray = new ImageHana();
			var textureHana:Texture = Texture.fromAtfData(bmpHana);
			var imageHana:Image = new Image(textureHana);
			addChild(imageHana);

			
			var bmpDaruma:ByteArray = new ImageDaruma();
			var textureDaruma:Texture = Texture.fromAtfData(bmpDaruma);
			var imageDaruma:Image = new Image(textureDaruma);
			imageDaruma.y = imageHana.height;
			addChild(imageDaruma);
			
		}
		

		
	}

}