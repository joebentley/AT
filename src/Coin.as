package
{
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Spritemap
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Coin extends Entity
	{
		[Embed(source = "assets/images/coin.png")] private const COIN:Class;
		[Embed(source = "assets/audio/coin.mp3")] private const COIN_SOUND:Class;
		
		private var i:Spritemap;
		private var sound:Sfx;
		public function Coin(_x:int, _y:int)
		{
			i = new Spritemap(COIN, 8, 10);
			i.scale = 4;
			graphic = i;
			
			type = "coin";
			
			setHitbox(i.scaledWidth, i.scaledHeight);
			
			x = _x;
			y = _y;
			
			i.add("anim", [0, 1], 3);
			i.play("anim");
			
			sound = new Sfx(COIN_SOUND);
		}
		
		override public function removed():void
		{
			sound.play();
		}
		/*
		override public function update():void
		{
			if (collide("player", x, y))
			{
				sound.play();
				FP.world.remove(this);
			}
		}*/
	}
}