package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Dirt extends Entity
	{
		[Embed(source = "assets/images/dirt.png")] private const DIRT:Class;
		private var i:Image = new Image(DIRT);
		
		public function Dirt(_x:int, _y:int)
		{
			x = _x;
			y = _y;
			
			i.scale = 3;
			graphic = i;
		}
	}
}