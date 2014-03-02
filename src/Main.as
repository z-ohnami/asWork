package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import sample.*;
	import work.*;
	
	import starling.core.Starling;
	import flash.geom.Rectangle;

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

//			run(sample.Act219,APPLICATION_TYPE_NORMAL);
			run(sample.Act605,APPLICATION_TYPE_STARLING);

		}
		
		private function run(className:Class,type:int = 1):void
		{
			stage.frameRate = 60;

			if (type == APPLICATION_TYPE_NORMAL) {
				//素のFlashの場合はこちら
				addChild(new className());

			} else if (type == APPLICATION_TYPE_STARLING) {
				//Starling の場合はこちら
				
				Starling.handleLostContext = true; // コンテキストのロストを防ぐ

				//フルスクリーン時の縦横幅を取得
				var screenWidth:int = stage.fullScreenWidth;
				var screenHeight:int = stage.fullScreenHeight;

				// ゲーム画面が縦横比を維持しつつ、スクリーンにフィットするようにViewportの縦横幅を算出する
				var viewport:Rectangle = new Rectangle(0, 0, screenWidth, screenHeight);
				
				_mStarling = new Starling(className, stage,viewport);
				_mStarling.start();
			}
		}
		
	}
}