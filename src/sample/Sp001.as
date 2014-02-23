package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class Sp001 extends Sprite
	{		
		public function Sp001()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			stage.color = 0x000000;

			var url:String = 'http://192.168.24.24/php/api.php';
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onLoaded);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(new URLRequest(url));
		}

		private function onLoaded(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var text:String = loader.data as String;
			showText(text);
		}

		private function showText(message:String):void
		{
			var text:TextField = new TextField();
			text.text = message;
			text.width = 200;
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;
			addChild(text);
		}
	}
}

import flash.display.Loader;
import flash.net.URLLoader;
import flash.events.Event;

internal class NetLoader {

	private static var _instance:NetLoader = null;

	public static function getInstance():NetLoader
	{
		if(!_instance) {
			_instance = new NetLoader();
			_instance.init();
		}
			
		return _instance;
	}

	private var _urlLoader:URLLoader;
	private var _loader:Loader;
	
	public function NetLoader():void
	{
	
	}

	private function init():void
	{
		_urlLoader = new URLLoader();
		_urlLoader.addEventListener(Event.COMPLETE,onURLLoaded);
		
	}

	private function onURLLoaded(event:Event)
	{
		
	}
	
}
