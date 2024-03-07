function MoveZombie() {
	speed = 0;
	if place_meeting(x, y, Obj_Player)
	{ xSpeed = 0; ySpeed = 0;}
	else { Pathfinding();}
	
	/*var touchedZombie = place_meeting(x, y, Obj_Zombie);
	xPush = 0;
	yPush = 0;
	if touchedZombie != noone {
		var pushDirection = point_direction(touchedZombie.x, touchedZombie.y, x, y) * pi/180;
		var pushAmount = 0.1;
		xPush = cos(pushDirection) * pushAmount;
		yPush = -sin(pushDirection) * pushAmount;
	}
	xSpeed += xPush;
	ySpeed += yPush;*/
	
	ZombieCollision();
}

function ZombieCollision() {
	var currTileMap = layer_tilemap_get_id("Tiles_Wall");
	//var touchingZombie = instance_place(x, y, Obj_Zombie);
	// X Collision
	var sensorDist = 60;
	
	if place_meeting(x + xSpeed, y, currTileMap)
	{
		var _pixelCheck = -sign(xSpeed);
		x += _pixelCheck;
		if(!UseSensor(x, y, Obj_Player.x, Obj_Player.y, 0.1)) {
			if(!UseSensor(x, y, x+(-sensorDist*_pixelCheck), y+sensorDist, 0.1)) {
				ySpeed = moveSpeed;
			} else if (!UseSensor(x, y, x+(-sensorDist*_pixelCheck), y-sensorDist, 0.1)) {
				ySpeed = -moveSpeed;
			}
		} else { ySpeed = sign(ySpeed)*moveSpeed;} // Why is this an error you fat shit
		xSpeed = 0;
	}
	// Y Collision
	if place_meeting(x + xSpeed, y + ySpeed, currTileMap)
	{
		var _pixelCheck = -sign(ySpeed);
		y += _pixelCheck;
		if(!UseSensor(x, y, Obj_Player.x, Obj_Player.y, 0.1)) {
			if(!UseSensor(x, y, x+sensorDist, y+(-sensorDist*_pixelCheck), 0.1)) {
				xSpeed = moveSpeed;
			} else if (!UseSensor(x, y, x-sensorDist, y+(-sensorDist*_pixelCheck), 0.1)) {
				xSpeed = -moveSpeed;
			}
		} else { xSpeed = sign(xSpeed)*moveSpeed;}
		ySpeed = 0;
	}
	
	x += xSpeed;
	y += ySpeed;
}

function Pathfinding() {
	if instance_exists(Obj_Player) {
		var xP = Obj_Player.x;
		var yP = Obj_Player.y;
		var currTileMap = layer_tilemap_get_id("Tiles_Wall");
		//var lof = collision_line(x, y, xP, yP, currTileMap, false, false);
		
		if (!UseSensor(x, y, xP, yP, 0.3)){
			//show_debug_message("Yes Yes!");
			moveDirection = point_direction(x, y, xP, yP) * pi/180;
			xSpeed = cos(moveDirection) * moveSpeed;
			ySpeed = -sin(moveDirection) * moveSpeed;
			//ZombieCollision();
			//x += xSpeed;
			//y += ySpeed;
		} else {
			//show_debug_message("I KNOW HOW TO PATHFIND :DDDDDDD");
			Dijkstra();
			FollowPath();
			//ZombieCollision();
		}
	} else {
		xSpeed = 0;
		ySpeed = 0;
	}
}

function FollowPath(){
	var equal = true;
	if(ds_list_size(createNodePath) == ds_list_size(nodePath)) {
		for(var i = 0; i < ds_list_size(createNodePath); i++) {
			if(ds_list_find_value(createNodePath, i) != ds_list_find_value(nodePath, i)) {
			    equal = false;
			    break;
			}
		}
	} else { equal = false;}
	
	
	if !equal {
		ds_list_copy(nodePath, createNodePath);
		var skipNode = ds_list_find_value(nodePath, 1);
		var currTileMap = layer_tilemap_get_id("Tiles_Wall");
		//var lof = collision_line(x, y, skipNode.x, skipNode.y, currTileMap, false, false);
		
		
		nextNodeIndex = (!UseSensor(x, y, skipNode.x, skipNode.y, 0.3) ? 1 : 0);
	}
	
	var nextNode = ds_list_find_value(nodePath, nextNodeIndex);
	//move_towards_point(nextNode.x, nextNode.y, moveSpeed);
	moveDirection = point_direction(x, y, nextNode.x, nextNode.y) * pi/180;
	xSpeed = cos(moveDirection) * moveSpeed;
	ySpeed = -sin(moveDirection) * moveSpeed;
	if position_meeting(x, y, nextNode) { nextNodeIndex++;}
}

function Dijkstra()
{
	ds_list_clear(steppedNodes);
	ds_list_clear(createNodePath);
	
	currNode = instance_nearest(x, y, Obj_Node);
	var xP = Obj_Player.x;
	var yP = Obj_Player.y;
	var currTileMap = layer_tilemap_get_id("Tiles_Wall");
	//var lof = collision_line(currNode.x, currNode.y, xP, yP, currTileMap, false, false);
	
	ds_list_add(createNodePath, currNode);
	do {
		ds_list_add(steppedNodes, currNode);
		var minEdge = 99999;
		var minID = 0;
		var stuckInLoop = true;
		
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
					stuckInLoop = false;
					minEdge = edge;
					minID = i;
				}
			}
		}
		currNode = ds_list_find_value(currNode.connections, minID);
		ds_list_add(createNodePath, currNode);
		//lof = collision_line(currNode.x, currNode.y, xP, yP, currTileMap, false, false);
		if stuckInLoop { break;}
	} until(!UseSensor(currNode.x, currNode.y, xP, yP, 0.3));
}

function ZombieHurt() {
	if hitFlash > 0 { hitFlash--;}
	
	var _inst = instance_place(x, y, Obj_PlayerProjectile);
	if _inst != noone {
		hp -= _inst.damage;
		instance_destroy(_inst);
		if hp <= 0 { die();}
		hitFlash = hitFlashSet;
	}
}

function DrawZombie() {
	var facing = sign(cos(direction*pi/180)); // remove sign() part for the funny
	var setFlash = (hitFlash > 0 ? true : false);
	
	gpu_set_fog(setFlash, c_white, 0, 1000)
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, drawColor, 1);
	gpu_set_fog(false, c_white, 0, 1000)
	
	draw_set_colour(c_black);
	draw_text_transformed(x, y, hp, 3, 3, 0);
	
	/*
	if ds_list_size(nodePath) > 0 {
		for(var i = 0; i < ds_list_size(nodePath)-1; i++) {
			var nodeA = ds_list_find_value(nodePath, i);
			var nodeB = ds_list_find_value(nodePath, i+1);
			
			draw_set_colour(c_red);
			draw_line_width(nodeA.x, nodeA.y, nodeB.x, nodeB.y, 5);
		}
	}
	*/
}