package
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player extends Entity
	{
		[Embed(source = "assets/images/finn.png")] private const PLAYER:Class;
		[Embed(source = "assets/audio/jump.mp3")] private const JUMP_SOUND:Class;
		[Embed(source = "assets/audio/jump_groundhit.mp3")] private const LANDING_SOUND:Class;
		[Embed(source = "assets/audio/step.mp3")] private const STEP_SOUND:Class;
		[Embed(source = "assets/audio/death.mp3")] private const DEATH_SOUND:Class;
		[Embed(source = "assets/audio/hit.mp3")] private const HIT_SOUND:Class;
		
		private var i:Spritemap;
		private var velocity:Point;
		private var acceleration:Point;
		private var speed:int;
		private var jumpsfx:Sfx;
		private var landsfx:Sfx;
		private var stepsfx:Sfx;
		private var deathsfx:Sfx;
		private var hitsfx:Sfx;
		
		public var score:int; // Points!!!
		public var health:int;
		
		public function Player(x:int, y:int)
		{
			i = new Spritemap(PLAYER, 8, 22);
			jumpsfx = new Sfx(JUMP_SOUND);
			landsfx = new Sfx(LANDING_SOUND);
			stepsfx = new Sfx(STEP_SOUND);
			deathsfx = new Sfx(DEATH_SOUND);
			hitsfx = new Sfx(HIT_SOUND);
			
			velocity = new Point(0, 0);
			acceleration = new Point(0.1, 0.5);
			speed = 3;
			
			score = 0;
			health = 3;
			
			i.scale = 6;
			graphic = i;
			
			this.x = x;
			this.y = y;
			
			type = "player";
			setHitbox(i.scaledWidth, i.scaledHeight);
			
			layer = -1;
			
			i.add("standing", [0]);
			i.add("walking", [1, 2, 3, 4], 10);
			i.play("standing");
		}
		
		private var walkCounter:int = 0; // For walking sound
		private var hitInvuln:Boolean = false; // Prevent double collision
		private var hitCounter:int = 0; // 3 second hit counter
		private var stopping:Boolean = false; // Check if stopping, for deceleration
		override public function update():void
		{
			// Add acceleration to velocities, if v + a is greater than maxspeed, set v to maxspeed
			if (Input.check("LEFT"))
			{
				velocity.x -= acceleration.x;
				if (velocity.x < -speed) { velocity.x = -speed; }
				i.flipped = true;
				i.play("walking");
			}
			
			if (Input.check("RIGHT"))
			{
				velocity.x += acceleration.x;
				if (velocity.x > speed) { velocity.x = speed; }
				
				i.flipped = false;
				i.play("walking");
			}
			
			// If on ground and left or right are released, slow until stop
			if (Input.released("LEFT") || Input.released("RIGHT"))
			{
				stopping = true;
			}
			
			// Slow to halt
			if (stopping)
			{
				var sign:int = FP.sign(velocity.x);
				velocity.x -= acceleration.x * sign;
				
				// Player has fully stopped, round to floor to prevent silly floating point errors
				if (Math.floor(Math.abs(velocity.x)) <= 0)
				{
					velocity.x = 0;
					stopping = false;
					i.play("standing");
					walkCounter = 0;
				}
			}
			
			if (Input.pressed("JUMP") && y == 350 - i.scaledHeight) // Only allow jumping on ground
			{
				jumpsfx.play();
				velocity.y = -10;
			}
			
			// TODO: Implement knee bend on jump, jumping anim
			
			if (y + velocity.y > 350 - i.scaledHeight) // We want to check that it will collide with the surface the frame before it passes through it
			{
				landsfx.play();
				y = 350 - i.scaledHeight;
				velocity.y = 0;	
			} else if (y < 350 - i.scaledHeight) { velocity.y += acceleration.y; }
			
			// Playing walking sound if not still and on ground, also ensure that animation speed is right
			if (velocity.x != 0 && y == 350 - i.scaledHeight)
			{
				if (walkCounter == 25) { stepsfx.play(0.8); walkCounter = 0; }
				walkCounter++;
			}
			
			// Camera scrolling behaviour, scroll if walking towards edge of screen :)
			if ((x > FP.camera.x + 400 && Input.check("RIGHT")) || (x < FP.camera.x + 120 + i.scaledWidth && Input.check("LEFT")))
			{
				FP.camera.x += Math.floor(velocity.x); // Snap camera.x to integer value to prevent artifacts
			}
			
			// Collisions
			if (collide("coin", x, y))
			{
				score += 100;
			}
			
			if (collide("enemy", x, y))
			{
				if (health > 0 && !hitInvuln)
				{ 
					health--;
					hitInvuln = true;
					hitsfx.play();
				}
				
				if (health == 0)
				{
					deathsfx.play(0.7);
					FP.world.remove(this);
				}
			}
			else if (hitCounter >= 120)
			{
				hitInvuln = false;
				hitCounter = 0;
				visible = true;
			}
			
			if (hitInvuln) { hitCounter++; }
			
			// Flashing effect
			if (hitCounter / 20 % 2 != 0 && hitCounter % 20 == 0) // odd n multiple of 30
			{
				trace(hitCounter);
				visible = false;
			}
			if (hitCounter / 20 % 2 == 0) // even n multiple
			{
				visible = true;
			}
			
			// Update movement
			x += velocity.x;
			y += velocity.y;
		}
	}
}