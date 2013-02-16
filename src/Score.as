package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	
	public class Score extends Entity
	{
		private var t:Text;
		
		public function Score()
		{
			t = new Text("Score: 0");
			graphic = t;
			
			graphic.scrollX = 0;
		}
		
		override public function update():void
		{
			t.text = "Score: " + Gameplay.player.score;
		}
	}
}