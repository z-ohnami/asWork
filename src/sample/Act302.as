package sample 
{
	
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Shape;	
	
	public class Act302 extends Sprite 
	{
		
		private var _shape:Sprite;
		
		public function Act302() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.color = 0x000000;
			drawCircle();
			adjustShape();
			
		}

		private function drawCircle():void
		{
			
			_shape = new Sprite();
			
			var circle:Shape = new Shape();
			circle.graphics.beginFill(0xFF0000);
			circle.graphics.drawCircle(0,0,50);
			circle.graphics.endFill();
			circle.x = 50;
			circle.y = 50;			
			_shape.addChild(circle);
			
			var rect:Shape = new Shape();
			rect.graphics.beginFill(0x00FF00);
			rect.graphics.drawRect(0,100,100,100);
			rect.graphics.endFill();
			_shape.addChild(rect);
			
			var triangle:Shape = new Shape();
			triangle.graphics.beginFill(0x0000FF,0.2);
			triangle.graphics.moveTo(50,0);
			triangle.graphics.lineTo(0,100);
			triangle.graphics.lineTo(100,100);
			triangle.graphics.lineTo(50,0);
			triangle.graphics.endFill();
			triangle.x = 0;
			triangle.y = 200;
			_shape.addChild(triangle);
			
		}
		
		private function adjustShape():void
		{
			_shape.x = (stage.stageWidth - _shape.width) / 2;
			_shape.y = (stage.stageHeight - _shape.height) / 2;
			addChild(_shape);
		}

		
	}

}