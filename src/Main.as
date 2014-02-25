package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.core.Starling;
	
	import sample.*;
	import work.*;

	[SWF(backgroundColor="#FFFFFF", width="360", height="640", frameRate="60")]
	public class Main extends Sprite
	{
		private static const APPLICATION_TYPE_NORMAL:int = 1;
		private static const APPLICATION_TYPE_STARLING:int = 2;

		private var _mStarling:Starling;
		
		public function Main()
		{
			super();
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

//			run(sample.Act018,APPLICATION_TYPE_NORMAL);
			run(sample.Act403,APPLICATION_TYPE_STARLING);

		}
		
		private function run(className:Class,type:int = 1):void
		{
			if (type == APPLICATION_TYPE_NORMAL) {
				addChild(new className());

			} else if (type == APPLICATION_TYPE_STARLING) {
				_mStarling = new Starling(className, stage);
				_mStarling.start();
			}
		}
		
	}
}