package
{
	import net.flashpunk.graphics.Image;
	
	public class Grass extends Block
	{
		[Embed(source = "assets/images/grass.png")] private const GRASS:Class;
		private var i:Image = new Image(GRASS);
		
		public function Grass(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			i.scale = 3;
			graphic = i;
		}
	}
}