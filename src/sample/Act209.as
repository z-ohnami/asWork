package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.StageWebView;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	
	public class Act209 extends Sprite
	{
		private var _stageWebView:StageWebView;
		
		public function Act209()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);

			var text:TextField = new TextField();
			text.width = 200;
			text.text = 'WebView';
			text.height = 20;
			addChild(text);
			
			_stageWebView = new StageWebView();
			_stageWebView.stage = stage;
			_stageWebView.viewPort = new Rectangle(0, text.height, stage.stageWidth, stage.stageHeight - text.height);
			_stageWebView.loadURL('http://souln.nijibox.co.jp/');

		}

		
	}
}
