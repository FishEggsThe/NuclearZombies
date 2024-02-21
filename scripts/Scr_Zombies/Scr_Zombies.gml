function MoveZombie() {
	if place_meeting(x, y, Obj_Player) { speed = 0;}
	else { speed = moveSpeed;}

	var goto = point_direction(x, y, Obj_Player.x, Obj_Player.y);
	direction = goto;
}

function ZombieCollision() {
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
}

function Pathfinding() {
	if instance_exists(Obj_Player) {
		var xP = Obj_Player.x;
		var yP = Obj_Player.y;
		var currTileMap = layer_tilemap_get_id("Tiles_Wall");
		var lof = collision_line(x, y, xP, yP, currTileMap, false, false);
		
		if (lof = noone){
			show_debug_message("Yes Yes!");
		} else {
			show_debug_message("No No No!");
		}
	}
}