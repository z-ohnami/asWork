package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class Act208 extends Sprite
	{
		public function Act208()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);

			var url:String = 'http://192.168.24.24/sampleClass.json';
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onLoaded);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(new URLRequest(url));
		}

		private function onLoaded(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			var data:String = loader.data as String;
			var appData:ApplicationData = new ApplicationData(data);
			showText(appData.buildText());
		}

		private function onLoadError(event:IOErrorEvent):void
		{
			showText('an error occured.');
		}
		
		private function showText(message:String):void
		{
			var text:TextField = new TextField();
			text.text = message;
			text.width = 300;
			text.height = 600;
//			text.wordWrap = true;
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;
			addChild(text);
		}
		
	}
}

internal class ApplicationData extends Object {
	private var name:String;
	private var type:String;
	private var platform:Vector.<String>;
	private var price:int = 0;
	private var isSale:Boolean = false;

	public function ApplicationData(jsonText:String):void
	{
		_parse(jsonText);
	}
	
	public function _parse(jsonText:String):void
	{
		var jsonObj:Object = JSON.parse(jsonText);

//こうしないといけないのでしょうか・・・
		var keyTables:Object = {
			name: "name",
			type: "type",
			platform: "platform",
			price: "price",
			isSale: "isSale"
		}
		
		for(var key:String in jsonObj) {
			var check:Boolean = keyTables.hasOwnProperty(key);
			if(!check)
				continue;
			
			if(key == 'platform') {
				setPlatform(jsonObj[key]);
			} else {
				this[key] = jsonObj[key]				
			}
		}
	}

	private function setPlatform(obj:Array):void
	{
		platform = new Vector.<String>();
		var l:int = obj.length;
		for(var i:int=0;i < l;i++) {
			platform.push(obj[i]);
		}
	}
	
	public function buildText():String
	{
		var text:String = 'アプリケーション名: ' + name + '¥r';
		text += 'ジャンル: ' + type + '¥r';
		text += 'プラットフォーム: ' + platform.join(',') + '¥r';
		text += '値段: ' + String(price) + '¥r';
		text += '状態: ' + (isSale) ? 'Now on sale' : 'Not for sale';
	
		return text;
	}
	
	
}