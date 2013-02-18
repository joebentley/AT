package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.ScreenRetro;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	[SWF(width = "640", height = "480")]
	
	public class Game extends Engine
	{
		public function Game()
		{
			super(640, 480);
			//FP.screen = new ScreenRetro; Uncomment for scanlines...
			FP.world = new Gameplay;
			
			Input.define("LEFT", Key.LEFT);
			Input.define("RIGHT", Key.RIGHT);
			Input.define("JUMP", Key.Z, Key.SPACE, Key.UP);
		}
	}
}