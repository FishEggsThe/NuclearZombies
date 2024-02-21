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
		
		CollisionHandler();
	} else {
		speed -= moveSpeedInc;
	}
	speed = clamp(speed, 0, moveSpeedMax);
}

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
	//hspeed = xSpeed;
	//vspeed = ySpeed;
}

function PlayerWeapon(){
	var input_fired =  mouse_check_button_pressed(mb_left);
	var input_swap =  keyboard_check_pressed(vk_space);
	
	gunAngle = point_direction(x, y, mouse_x, mouse_y);
	
	if input_fired { fire_weapon(); }
	else if (input_swap && wepB > -1) {
		var temp = wepA;
		wepA = wepB;
		wepB = temp;
		UpdateWeapon(wepA);
	}
}

function DrawPlayer(){
	var facing = sign(cos(gunAngle*pi/180)); // remove sign() part for the funny
	
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
	draw_sprite_ext(wepSprite, image_index, x, y, 1, facing, gunAngle, c_white, 1);
}

function CameraControl(){
	var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
	var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
	camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);
}