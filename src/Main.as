package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import sample.*;
	import work.*;

	[SWF(backgroundColor="#FFFFFF", width="360", height="640", frameRate="60")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var act:sample.Act018 = new sample.Act018();
			addChild(act);

		}
	}
}