package sample
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class Act107 extends Sprite
	{		
		private var _timeText:TextField;
		private var _timer:Timer;
		
		public function Act107()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,initalize);
		}
		
		private function initalize(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,initalize);
			setTimeFormat();
			
			_timer = new Timer(1000);
			_timer.addEventListener(TimerEvent.TIMER,updateTime);
			_timer.start();
		}

		private function setTimeFormat():void
		{
			_timeText = new TextField();
			_timeText.width = 200;
			_timeText.text = getCurrentTime();
			_timeText.x = (stage.stageWidth - _timeText.width) / 2;
			_timeText.y = (stage.stageHeight - _timeText.height) / 2;
			addChild(_timeText);
		}

		private function updateTime(event:TimerEvent):void
		{
			_timeText.text = getCurrentTime();
		}

		private function getCurrentTime():String
		{
			var date:Date = new Date();
			var hours:String = date.hours.toString();
			var minutes:String = date.minutes.toString();
			var seconds:String = date.seconds.toString();
			
			if(hours.length == 1)
				hours = '0'+hours;

			if(minutes.length == 1)
				minutes = '0'+minutes;

			if(seconds.length == 1)
				seconds = '0'+seconds;
						
			return hours + ':' + minutes + ':' + seconds;

		}
		
	}
}