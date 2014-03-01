package sample 
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import flash.utils.ByteArray;
	
	public class Act406 extends Sprite 
	{
		
		[Embed(source = '/img/daruma.atf', mimeType='application/octet-stream')]
		private static const ImageDaruma:Class;
		
		private var _image:RoundImage;
			
		public function Act406() 
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
			var bmpDaruma:ByteArray = new ImageDaruma();
			var textureDaruma:Texture = Texture.fromAtfData(bmpDaruma);
			_image = new RoundImage(textureDaruma);
			_image.scaleX *= 0.5;
			_image.scaleY *= 0.5;
			addChild(_image);
		}
		
	}

}

import starling.display.Image;
import starling.textures.Texture;
import starling.events.Event;

internal class RoundImage extends Image
{
	private var _centerX:int = 0;
	private var _centerY:int = 0;
	private var _radius:int = 150;
	private var _degree:Number = 0;
	
	public function RoundImage(texture:Texture):void
	{
		super(texture);
		addEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(Event.ENTER_FRAME,render);
	}
	
	private function init(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		_centerX = (stage.stageWidth - width) >> 1;
		_centerY = (stage.stageHeight - height) >> 1;		

		x = (stage.stageWidth - width) >> 1;
		y = 0;
	}

	private function render():void
	{
		x = _centerX + _radius * Math.cos(_degree * (180 / Math.PI));
		y = _centerY + _radius * Math.sin(_degree * (180 / Math.PI));
		_degree += 0.001;
	}

}