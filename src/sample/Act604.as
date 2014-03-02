package sample 
{
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.PickerList;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Act604 extends Sprite 
	{

		private var _theme:MetalWorksMobileTheme;
		private var _list:PickerList;

		public function Act604() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.color = 0x000000;
			_theme = new MetalWorksMobileTheme(stage,true);

			_list = new PickerList();
			_list.width = 300;
			_list.height = 40;
			_list.dataProvider = getList();
			_list.listProperties.@itemRendererProperties.labelField = 'text';
			_list.labelField = 'text';
			_list.prompt = 'choose them';
			_list.selectedIndex = -1;
			_list.addEventListener(Event.CHANGE,listHandler);
			
			
			_list.buttonFactory = function():Button
			{
				var button:Button = new Button();
				button.width = 180;
				button.height = 40;
				button.x = (stage.stageWidth - button.width) >> 1;
				button.y = (stage.stageHeight - button.height) >> 1;
				return button;
			};
			
			addChild(_list);

		}

		private function getList():ListCollection
		{
			var list:ListCollection = new ListCollection([
				{text:'coffee'},
				{text:'tea'},
				{text:'milk'},
				{text:'cocoa'},
				{text:'beer'},
				{text:'wine'},
				{text:'xxx'},
			]);
			
			return list;
		}
		
		private function listHandler(event:Event):void
		{
			var list:PickerList = PickerList(event.currentTarget);
			trace('selected item is ' + list.selectedItem.text);
		}
		
	}


}