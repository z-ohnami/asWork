package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import sample.Act001;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var act:sample.Act001 = new sample.Act001();
			addChild(act);
			
		}
	}
}