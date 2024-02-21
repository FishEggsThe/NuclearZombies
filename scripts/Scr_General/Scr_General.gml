function CollisionHandler(){
	var currTileMap = layer_tilemap_get_id("Tiles_Wall");
	// X Collision
	if place_meeting(x + hspeed, y, currTileMap)
	{
		var _pixelCheck = sign(hspeed);
		while !place_meeting(x+_pixelCheck, y, currTileMap)
		{
			x += _pixelCheck;
		}
	
		hspeed = 0;
	}
	// Y Collision
	if place_meeting(x + hspeed, y + vspeed, currTileMap)
	{
		var _pixelCheck = sign(vspeed);
		while !place_meeting(x+hspeed, y+_pixelCheck, currTileMap)
		{
			y += _pixelCheck;
		}
	
		vspeed = 0;
	}
}