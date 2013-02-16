package
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image;
	
	public class Cloud extends Entity
	{
		[Embed(source = "assets/images/cloud.png")] private const CLOUD:Class;
		[Embed(source = "assets/images/cloudsmall.png")] private const CLOUDSMALL:Class;
		
		private var i:Image;
		
		public function Cloud(x:int, y:int)
		{
			// Randomly select cloud sprite
			if (Math.random() < 0.5) { i = new Image(CLOUD); }
			else { i = new Image(CLOUDSMALL); }
			
			i.scale = 2;
			graphic = i;
			
			layer = 1;
			
			this.x = x;
			this.y = y;
			
			graphic.scrollX = 0.4;
		}
		
		override public function update():void
		{
			x -= 0.3;
		}
	}
}