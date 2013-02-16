package
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	
	public class Level
	{
		public var ID:int;
		public var entities:Vector.<Entity>
		public var bounds:Rectangle;
		public var playerPos:Point;
		
		public function Level(ID:int = 0, entities:Vector.<Entity> = null, levelBoundary:Rectangle = null, playerPos:Point = null)
		{
			this.ID = ID;
			this.entities = (entities == null ? new Vector.<Entity> : entities);
			this.bounds = (levelBoundary == null ? new Rectangle() : levelBoundary);
			this.playerPos = (playerPos == null ? new Point() : playerPos);
		}
	}
}