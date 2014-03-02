package sample 
{
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Act601 extends Sprite 
	{

		private var _theme:MetalWorksMobileTheme;
		private var _button:Button;
		
		public function Act601() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.color = 0x000000;
			_theme = new MetalWorksMobileTheme(stage,true);

			_button = new Button();
			_button.label = 'push';
			_button.addEventListener(Event.TRIGGERED,buttonHandler);
			_button.width = 100;
			_button.height = 60;
			_button.x = (stage.stageWidth - _button.width) >> 1;
			_button.y = (stage.stageHeight - _button.height) >> 1;			
			addChild(_button);

		}

		private function buttonHandler(event:Event):void
		{
			const label:Label = new Label();
			label.text = 'button pushed!!';
			Callout.show(label,_button);
		}
		
	}



}