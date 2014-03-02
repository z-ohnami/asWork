package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.LocationChangeEvent;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	import flash.text.TextField;
	
	public class Act210 extends Sprite
	{
		private var _stageWebView:StageWebView;
		
		public function Act210()
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
			_stageWebView.loadURL('http://cuaoar.jp/');

			_stageWebView.addEventListener(LocationChangeEvent.LOCATION_CHANGING, locationChangeHandler);
			
		}

		private function locationChangeHandler(event:LocationChangeEvent):void
		{
			trace('tapped url is ' + event.location);
		}
		
	}
}
