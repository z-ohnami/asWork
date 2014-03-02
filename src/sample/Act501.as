package sample 
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import flash.utils.ByteArray;
	
	public class Act501 extends Sprite 
	{
		
		[Embed(source = '/img/daruma.atf', mimeType='application/octet-stream')]
		private static const ImageDaruma:Class;
		
		private var _image:RoundImage;
			
		public function Act501() 
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
import a24.tween.Tween24;
import a24.tween.Ease24;

internal class RoundImage extends Image
{
	private var _centerX:int = 0;
	private var _centerY:int = 0;
	private var _radius:int = 120;
	private var _degree:Number = 0;
	private var _rotation:Number = 0;
	private var _posX:int = 0;
	private var _posY:int = 0;
	
	public function RoundImage(texture:Texture):void
	{
		super(texture);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		_centerX = (stage.stageWidth - width) >> 1;
		_centerY = (stage.stageHeight - height) >> 1;		

		x = (stage.stageWidth - width) >> 1;
		y = 0;
		pivotX = width / 2;
		pivotY = height / 2;
		
		_posX = x;
		_posY = y;
		
		addTween();
		
	}

	private function addTween():void
	{
		Tween24.loop(0, 
			Tween24.serial(
				Tween24.tween(this, 0.5, Ease24._Linear).$xy(_posX,_posY),
				Tween24.func(update)
			)
		).play();
	}

	private function update():void
	{
		_posX = _centerX + _radius * Math.cos(_degree * (180 / Math.PI));
		_posY = _centerY + _radius * Math.sin(_degree * (180 / Math.PI));
		_degree += 0.001;
		_rotation += 0.1;		
	}
}