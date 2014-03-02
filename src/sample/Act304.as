package sample 
{
	
	
	import flash.display.Bitmap;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Act304 extends Sprite 
	{

		[Embed(source = '/img/character_sample.png', mimeType='image/png')]
		private static const ImageCharacter:Class;
		
		[Embed(source = '/img/character_sample.xml', mimeType='application/octet-stream')]
		private static const ImageCharacterXML:Class;
				
		public function Act304() 
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
			var bmpCharacter:Bitmap = new ImageCharacter() as Bitmap;
			var textureCharacter:Texture = Texture.fromBitmap(bmpCharacter);
			var xml:XML = XML(new ImageCharacterXML());
			var atlasCharacter:TextureAtlas = new TextureAtlas(textureCharacter,xml);

			var character:Image = new Image(atlasCharacter.getTexture('character1'));
			
			
			addChild(character);

			
			
		}
		

		
	}

}