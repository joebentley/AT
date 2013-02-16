package
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	// Marie: make Jake and Finn's fist move toward the centre and when its loaded they respect 
	public class Gameplay extends World
	{
		//[Embed(source = "assets/audio/testsong.mp3")] private const MUSIC:Class;
		//private var music:Sfx;
		
		//[Embed(source = "assets/levels/one.png")] private const LEVELONE:Class;
		[Embed(source = "assets/levels/levels.json", mimeType="application/octet-stream")] private const LEVELS:Class;
		
		public static var player:Player;
		public var clouds:Cloudfield;
		public var level:Level;
		
		public function Gameplay()
		{
			FP.screen.color = 0x33BBFF;
			//music = new Sfx(MUSIC);
			
			level = LevelParser.GetLevelByID(0, LEVELS);
			
			player = new Player(level.playerPos.x, level.playerPos.y);
			
			clouds = new Cloudfield();
			
			for each (var c:Cloud in clouds.GenerateCloudfield(new Rectangle(-2000, 20, 4000, 150)))
			{
				add(c);
			}
			
			/*for each (var e:Entity in level.entities)
			{
				add(e);
			}*/
			
			add(player);
			add(new Score);
			add(new Health);
			
			add(new Coin(300, 280));
			add(new Coin(400, 280));
			
			add(new Enemy(800, 350 - 12 * 4));
			
			// Generate level, this is just for testing...
			for (var i:int = -40; i < 40 ; i++) 
			{
				add(new Grass(i * 16 * 3, 350));
			}
			
			for (var j:int = -40; j < 40; j++) 
			{
				for (var k:int = 1; k < 3; k++) 
				{
					add(new Dirt(j * 16 * 3, 350 + k * 16 * 3));
				}
			}
		}
	}
}