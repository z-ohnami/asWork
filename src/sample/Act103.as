package sample
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Act103 extends Sprite
	{
		private var _shape:Sprite;
		
		public function Act103()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
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
			triangle.graphics.beginFill(0x0000FF);
			var vertics:Vector.<Number> = new Vector.<Number>();
			vertics.push(50,0);
			vertics.push(0,100);
			vertics.push(100,100);
			triangle.graphics.drawTriangles(vertics);
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