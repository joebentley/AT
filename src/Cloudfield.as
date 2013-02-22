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
		private var previousY:int = 0;
		private var currY:int = 0;
		public function GenerateCloudfield(rect:Rectangle):Vector.<Cloud>
		{
			// Generate cloud every 200 to 600 pixels on x-axis
			for (var x:int = rect.x; x < rect.width; x += (200 + 200 * Math.random()))
			{
				// Don't generate a cloud if too close to previous Y value
				do
				{
					currY = rect.y + rect.height * Math.random();
				} while (currY >= previousY - 40 && currY <= previousY + 40);
				
				// Generate cloud at x and y somewhere between rect.y and rect.height
				clouds.push(new Cloud(x, currY));
				
				previousY = currY;
			}
			
			return clouds;
		}
	}
}