package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class Act203 extends Sprite
	{		
		public function Act203()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);

			var url:String = 'http://192.168.24.24/php/api.ph';
//			var url:String = 'http://192.168.24.24/php/api.php';
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onLoaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(new URLRequest(url));
		}

		private function onLoaded(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var text:String = loader.data as String;
			trace('API retun ' + text);
			showText(text);
		}

		private function onLoadError(event:IOErrorEvent):void
		{
			showText('an error occured.');
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
