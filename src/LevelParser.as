package
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import com.adobe.serialization.json.JSON;
	
	public class LevelParser
	{
		public static function GetLevelByID(ID:int, source:Class):Level
		{
			// Store new entity
			var populated:Vector.<Entity> = new Vector.<Entity>();
			
			// Parse file into string
			var bytes:ByteArray = new source();
			var json:String = bytes.readUTFBytes(bytes.length);
			var levels:Object = JSON.decode(json);
			
			// Find correct level
			
			for each (var level:Object in levels.levels)
			{
				if (level.ID == ID)
				{
					for each (var entity:Object in level.entities) 
					{
						if (entity.type == "grass") { populated.push(new Grass(entity.x, entity.y)); }
						if (entity.type == "dirt") { populated.push(new Dirt(entity.x, entity.y)); }
					}
					
					return new Level(level.ID, populated, new Rectangle(level.boundingX, 0, 0, 0), new Point(level.playerX, level.playerY));
				}
			}
			
			return new Level();
		}
	}
}