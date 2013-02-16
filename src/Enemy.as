package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	public class Enemy extends Entity
	{
		[Embed(source = "assets/images/gunter.png")] private const GUNTER:Class;
		private var i:Spritemap;
		
		public function Enemy(x:int, y:int)
		{
			i = new Spritemap(GUNTER, 8, 12);
			i.scale = 4;
			i.add("walk", [0, 1], 4);
			graphic = i;
			
			this.x = x;
			this.y = y;
			
			type = "enemy";
			setHitbox(i.scaledWidth, i.scaledHeight);
			
			i.play("walk");
		}
		
		private var onScreen:Boolean = false;
		override public function update():void
		{
			if (onCamera) { onScreen = true; }
			
			if (onScreen) { x -= 1; }
		}
	}
}