package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	public class Act207 extends Sprite
	{
		public function Act207()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);

			var url:String = 'http://www.drk7.jp/weather/xml/13.xml';
			
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
			parseXML(data);
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
		
		private function parseXML(xmlText:String):void
		{
			var xml:XML = new XML(xmlText);
			
			var text:TextField = new TextField();
			text.text = getTodayWeatherText(xml);
			text.width = 200;
			text.x = (stage.stageWidth - text.width) / 2;
			text.y = (stage.stageHeight - text.height) / 2;
			addChild(text);
			
		}		

		private function getTodayWeatherText(xml:XML):String
		{
			var areaName:String = '東京地方';
			var date:String = getCurrentDate();
			var w:XML = new XML(xml.pref.area.(@id == areaName).info.(@date == date));
			return areaName + ' : \n ' + w.weather + ' ' + w.wave;
		}

		private function getCurrentDate():String
		{
			var date:Date = new Date();
			var year:String = date.fullYear.toString();
			var month:String = (date.month + 1).toString();
			var day:String = date.date.toString();
			
			if(month.length == 1)
				month = '0'+month;

			if(day.length == 1)
				day = '0'+day;
						
			return year + '/' + month + '/' + day;

		}
		
	}
}
