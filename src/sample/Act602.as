package sample 
{
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.data.ListCollection;
	import feathers.themes.MetalWorksMobileTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Act602 extends Sprite 
	{

		private var _theme:MetalWorksMobileTheme;
		private var _list:List;
		
		public function Act602() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.color = 0x000000;
			_theme = new MetalWorksMobileTheme(stage,true);

			_list = new List();
			_list.width = stage.stageWidth;
			_list.height = stage.stageHeight;
			_list.dataProvider = getList();
			_list.itemRendererProperties.labelField = 'text';
			_list.addEventListener(Event.CHANGE,listHandler);
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
			var list:List = List(event.currentTarget);
			trace('selected item is ' + list.selectedItem.text);
		}
		
	}


}