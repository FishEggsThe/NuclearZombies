if place_meeting(x, y, Obj_Player) { speed = 0;}
else { speed = moveSpeed;}

var goto = point_direction(x, y, Obj_Player.x, Obj_Player.y);
direction = goto;

var currTileMap = layer_tilemap_get_id("Tiles_Wall");
// X Collision
if place_meeting(x + hspeed, y, currTileMap)
{
	var _pixelCheck = -sign(hspeed);
	x += _pixelCheck;
}
// Y Collision
if place_meeting(x + hspeed, y + vspeed, currTileMap)
{
	var _pixelCheck = -sign(vspeed);
	y += _pixelCheck;
}