package dicks 
{
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.bit101.components.TextArea;
	import com.bit101.components.Window;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import org.flixel.FlxButton;
	import org.flixel.system.FlxWindow;
	/**
	 * ...
	 * @author Knut
	 */
	public class DebugPanel extends Window
	{
		internal var textArea1:TextArea;
		internal var textArea2:TextArea;
		public function DebugPanel() 
		{
			super(null, 100, 100, "Debug Panel");
			super.height = 150;
			super.width = 200;
			addChild(new Label(this, 0, 0, "World gravity:"));
			textArea1 = new TextArea(this, 65, 0, "2");
			textArea1.height = 18;
			textArea1.width = 40;
			addChild(new PushButton(this, 110, 0, "Apply", setWorldG));
			addChild(textArea1);
			addChild(new Label(this, 0, 20, "World divisible:"));
			textArea2 = new TextArea(this, 65, 20, "4");
			textArea2.height = 18;
			textArea2.width = 40;
			addChild(new PushButton(this, 110, 20, "Apply", setWorldDivisible));
			addChild(textArea2);
		}
		private function setWorldG(e:Event):void
		{
			World.worldG = new Number(textArea1.text);
		}
		private function setWorldDivisible(e:Event):void
		{
			World.worldDivisible = new Number(textArea2.text);
		}
		
	}

}