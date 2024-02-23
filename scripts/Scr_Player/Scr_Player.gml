function MovePlayer(){
	var input_left = keyboard_check(ord("A"));
	var input_right = keyboard_check(ord("D"));
	var input_up = keyboard_check(ord("W"));
	var input_down = keyboard_check(ord("S"));

	horizontalDirection = input_right - input_left;
	verticalDirection = input_down - input_up;
	var moveDirection = point_direction(0, 0, horizontalDirection, verticalDirection); //* pi/180;

	var checkForMovement = abs(horizontalDirection) + abs(verticalDirection)
	if (checkForMovement > 0) {
		direction = moveDirection;
		speed += moveSpeedInc;
		//xSpeed += cos(moveDirection) * moveSpeedInc;
		//ySpeed += -sin(moveDirection) * moveSpeedInc;
		
		PlayerCollision();
	} else {
		speed -= moveSpeedInc;
	}
	speed = clamp(speed, 0, moveSpeedMax);
	xDraw = x;
	yDraw = y;
}

function PlayerCollision(){
	var currTileMap = layer_tilemap_get_id("Tiles_Wall");
	// X Collision
	if place_meeting(x + hspeed, y, currTileMap)
	{
		var _pixelCheck = sign(hspeed);
		while !place_meeting(x+_pixelCheck, y, currTileMap)
		{
			x += _pixelCheck;
		}
		x -= _pixelCheck;
		
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
		y -= _pixelCheck;
	
		vspeed = 0;
	}
	//hspeed = xSpeed;
	//vspeed = ySpeed;
}

function PlayerHurt() {
	if invFrames > 0 { invFrames--;}
	
	var _inst = instance_place(x, y, Obj_Zombie);
	if (_inst != noone && invFrames <= 0) {
		hp -= _inst.contactDamage;
		//instance_destroy(_inst);
		if hp <= 0 {die = true;}
		invFrames = setInvFrames;
	}
	//if die { }
}

function PlayerWeapon(){
	var input_fired =  mouse_check_button_pressed(mb_left);
	var input_swap =  keyboard_check_pressed(vk_space);
	
	gunAngle = point_direction(x, y, mouse_x, mouse_y);
	if wepPushback > 0 { wepPushback--;}
	if reload > 0 { reload--;}
	
	PickupWeapon();
	
	if(input_fired && reload <= 0) { fire_weapon(); }
	else if (input_swap && loadout[1] > -1) {
		loadoutID++;
		if(loadoutID >= loadoutSize) { loadoutID = 0;}
		UpdateWeapon(loadout[loadoutID]);
	}
}

function PickupWeapon(){
	var nearestWeapon = instance_nearest(x, y, Obj_WeaponPickup);
	if collision_circle(x, y, 48, nearestWeapon, false, false) {
		nearestWeapon.inRange = true;
		var input_pickup = keyboard_check(ord("E"));
		if input_pickup {
			loadout[loadoutID] = nearestWeapon.wepID;
			UpdateWeapon(loadout[loadoutID]);
			instance_destroy(nearestWeapon);
		}
	}
}

function DrawPlayer(){
	var facing = sign(cos(gunAngle*pi/180)); // remove sign() part for the funny
	var setFlash = (invFrames % 4 < 2 ? false : true);
	
	gpu_set_fog(setFlash, c_white, 0, 1000)
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
	gpu_set_fog(false, c_white ,0 ,1000)
	var xBack = cos(gunAngle*pi/180) * wepPushback;
	var yBack = -sin(gunAngle*pi/180) * wepPushback;
	draw_sprite_ext(wepSprite, image_index, x-xBack, y-yBack, 1, facing, gunAngle, c_white, 1);
}