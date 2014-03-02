package sample
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Act201 extends Sprite
	{		
		public function Act201()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			stage.color = 0x000000;

			var url:String = 'http://192.168.24.24/img/koke.jpg';
			
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT,onLoaded);
			loader.load(new URLRequest(url));
		}

		private function onLoaded(event:Event):void
		{
			var loader:Loader = event.currentTarget.loader;
			addChild(loader);
		}
		
	}
}