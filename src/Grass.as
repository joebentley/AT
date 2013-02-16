package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Grass extends Entity
	{
		[Embed(source = "assets/images/grass.png")] private const GRASS:Class;
		private var i:Image = new Image(GRASS);
		
		public function Grass(_x:int, _y:int)
		{
			x = _x;
			y = _y;
			
			i.scale = 3;
			graphic = i;
		}
	}
}