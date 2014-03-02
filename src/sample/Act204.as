package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	
	public class Act204 extends Sprite
	{		
		public function Act204()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			
			var url:String = 'http://192.168.24.24/php/api.php';
			
			var postData:URLVariables = new URLVariables();
			postData.select_id = 1;
			
			var request:URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.POST;
			request.data = postData;
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onLoaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(request);
		}

		private function onLoaded(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var text:String = loader.data as String;
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
