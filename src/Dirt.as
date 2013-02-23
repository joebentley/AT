package
{
	import net.flashpunk.graphics.Image;
	
	public class Dirt extends Block
	{
		[Embed(source = "assets/images/dirt.png")] private const DIRT:Class;
		private var i:Image = new Image(DIRT);
		
		public function Dirt(x:int, y:int)
		{
			this.x = x;
			this.y = y;
			
			i.scale = 3;
			graphic = i;
		}
	}
}