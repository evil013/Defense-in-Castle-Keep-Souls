package dicks
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import org.flixel.FlxGame;

	/**
	 * ...
	 * @author Knut
	 */
	[Frame(factoryClass="dicks.Preloader")]
	public class Main extends Sprite
	{
		public static const game:FlxGame = new FlxGame(640, 480, null, 1, 60, 30, true);
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new World());
			addChild(new DebugPanel());
			stage.addEventListener(MouseEvent.CLICK, clickMouse);
		}
		private function clickMouse(e:MouseEvent):void {
			var arrow:Arrow = new Arrow(50, 500);
			arrow.fire(e.stageX, e.stageY);
			addChild(arrow);
		}

	}

}