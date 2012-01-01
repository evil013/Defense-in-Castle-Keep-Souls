package dicks 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Knut
	 */
	public class Arrow extends Sprite
{
    //g is constant
    //it's actually closer to 10 but this is our world
    //public static var g:Number = World.worldG;
	//public static var divisible:Number = World.worldDivisible;

    //our arrow
    private var arrow:Shape;

    //start velocities
    private var ux:Number;
    private var uy:Number;

    public function Arrow(xop:Number, yop:Number)
    {
        arrow = new Shape();
        arrow.graphics.lineStyle( 1, 0 );
        arrow.graphics.lineTo( 30, 0 );
		x = xop;
		y = yop;
    }

    public function fire( vx:Number, vy:Number ):void
    {
        ux = vx;
        uy = vy;
        addChild( arrow );
        addEventListener( Event.ENTER_FRAME, fly );
		trace("Arrow flying");
    }

    private function fly( e:Event ):void
    {
        //lets use our equations
        var sx:Number = ux;       //distance moved in x dir

        var vy:Number = uy + World.worldG    //new velocity in y dir
        var sy:Number = uy + World.worldG/2  //distance moved in y dir

        //apply to arrow
        arrow.x += sx / World.worldDivisible;
        arrow.y += sy / World.worldDivisible;

        //save new y velocity
        uy = vy;

        //extra bonus rotation of arrow to point in the right direction
        arrow.rotation = Math.atan2( uy, ux ) * 180 / Math.PI;
		if (arrow.x > stage.stageWidth || arrow.y > stage.stageHeight) destroy();
		//trace("X: ", arrow.x, " Y:", arrow.y);
    }
	public final function destroy():void
	{
		removeEventListener(Event.ENTER_FRAME, fly);
		graphics.clear();
		parent.removeChild(this);
	}

}


}