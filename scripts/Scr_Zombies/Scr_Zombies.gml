function MoveZombie() {
	if place_meeting(x, y, Obj_Player) { speed = 0;}
	//else { speed = moveSpeed;}
	
	Pathfinding();

	
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

function ZombieHurt() {
	var _inst = instance_place(x, y, Obj_PlayerProjectile);
	if _inst != noone {
		hp -= _inst.damage;
		instance_destroy(_inst);
		if hp <= 0 { die();}
	}
}

function Pathfinding() {
	if instance_exists(Obj_Player) {
		speed = moveSpeed;
		var xP = Obj_Player.x;
		var yP = Obj_Player.y;
		var currTileMap = layer_tilemap_get_id("Tiles_Wall");
		var lof = collision_line(x, y, xP, yP, currTileMap, false, false);
		
		if (lof == noone){
			//show_debug_message("Yes Yes!");
			var goto = point_direction(x, y, xP, yP);
			direction = goto;
		} else {
			//show_debug_message("I don't know how to make fucking pathfinding");
			Dijkstra();
		}
	} else {
		speed = 0;
	}
}

function Dijkstra()
{
	ds_list_clear(steppedNodes);
	ds_list_clear(nodePath);
	
	currNode = instance_nearest(x, y, Obj_Node);
	var xP = Obj_Player.x;
	var yP = Obj_Player.y;
	var currTileMap = layer_tilemap_get_id("Tiles_Wall");
	var lof = collision_line(currNode.x, currNode.y, xP, yP, currTileMap, false, false);
	
	ds_list_add(nodePath, currNode);
	do {
		ds_list_add(steppedNodes, currNode);
		var minEdge = 99999;
		var minID = 0;
		
		for(var i = 0; i < ds_list_size(currNode.connections); i++)
		{
			var node = ds_list_find_value(currNode.connections, i);
			var checkIfAlreadyGoneHere = ds_list_find_index(steppedNodes, node);
			
			if (checkIfAlreadyGoneHere <= -1)
			{
				//var edge = ds_list_find_value(currNode.edges, i);
				var edge = point_distance(node.x, node.y, xP, yP);
				
				if (edge < minEdge)
				{
					minEdge = edge;
					minID = i;
				}
			}
		}
		currNode = ds_list_find_value(currNode.connections, minID);
		ds_list_add(nodePath, currNode);
		lof = collision_line(currNode.x, currNode.y, xP, yP, currTileMap, false, false);
	} until(lof == noone);
}

function DrawZombie() {
	var facing = sign(cos(direction*pi/180)); // remove sign() part for the funny
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
	draw_set_colour(c_black);
	draw_text_transformed(x, y, hp, 3, 3, 0);
	
	if ds_list_size(nodePath) > 0 {
		for(var i = 0; i < ds_list_size(nodePath)-1; i++) {
			var nodeA = ds_list_find_value(nodePath, i);
			var nodeB = ds_list_find_value(nodePath, i+1);
			
			draw_set_colour(c_red);
			draw_line_width(nodeA.x, nodeA.y, nodeB.x, nodeB.y, 5);
		}
	}
}