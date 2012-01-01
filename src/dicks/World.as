package dicks 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Knut
	 */
	public class World extends Sprite
	{
		
		public static var worldG:Number = 2;
		public static var worldDivisible:Number = 4;
		private static var mapPoints:Array = new Array(50);
		public function World() 
		{
			addEventListener(Event.ADDED_TO_STAGE, buildWorld);
		}
		private function buildWorld(e:Event):void
		{
			for (var i:int = 0; i < mapPoints.length - 1; i++) {
				mapPoints[i] = new Point((stage.stageWidth / mapPoints.length - 1) * i, randomNumber(40, stage.stageHeight));
			}
			drawWorld();
		}
		private function drawWorld():void
		{
			graphics.beginFill(0x000000);
			for (var i:int = 0; i < mapPoints.length - 1; i++) {
				var x:Number = (mapPoints[i] as Point).x;
				var y:Number = (mapPoints[i] as Point).y;
				graphics.lineTo(x, y);
			}
			graphics.lineTo(stage.stageWidth, stage.stageHeight);
			graphics.lineTo(0, stage.stageHeight);
			graphics.endFill();
			trace("Done drawing world");
		}
		private function randomNumber(low:Number=0, high:Number=1):Number
		{
			return Math.round(Math.random() * (high - low)) + low;
		}
	}

}