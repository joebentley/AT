package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	public class Health extends Entity
	{
		[Embed(source = "assets/images/health.png")]
		private const HEALTH_SPRITE:Class;
		private var i:Spritemap;
		
		public function Health():void
		{
			i = new Spritemap(HEALTH_SPRITE, 23, 7);
			i.scale = 3;
			graphic = i;
			
			x = 640 - i.scaledWidth - 4; // Keep in screen with slight gap
			y = 4;
			
			graphic.scrollX = 0; // Stay in same pos on screen
			
			i.setFrame(0, 0);
			
			layer = -1;
		}
		
		override public function update():void
		{
			// Set frame depending on player health
			if (Gameplay.player.health == 0) {
				i.setFrame(0, 0);
			} else if (Gameplay.player.health == 1) {
				i.setFrame(1, 0);
			} else if (Gameplay.player.health == 2) {
				i.setFrame(2, 0);
			} else if (Gameplay.player.health == 3) {
				i.setFrame(3, 0);
			}
		}
	}
}