package
{
	import flash.geom.Rectangle;
	public class Cloudfield
	{
		private var clouds:Vector.<Cloud>;
		
		public function Cloudfield()
		{
			clouds = new Vector.<Cloud>;
		}
		
		public function GetCloudfield():Vector.<Cloud>
		{
			return clouds;
		}
		
		/**
		 * 
		 * @param	rect You will want to use an x value far in the negative, and large width
		 */
		public function GenerateCloudfield(rect:Rectangle):Vector.<Cloud>
		{
			// Generate cloud every 200 to 600 pixels on x-axis
			for (var x:int = rect.x; x < rect.width; x += (200 + 200 * Math.random()))
			{
				// Generate cloud at x and y somewhere between rect.y and rect.height
				clouds.push(new Cloud(x, rect.y + rect.height * Math.random()));
			}
			
			return clouds;
		}
	}
}