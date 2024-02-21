function MovePlayer(){
	var input_left = keyboard_check(ord("A"));
	var input_right = keyboard_check(ord("D"));
	var input_up = keyboard_check(ord("W"));
	var input_down = keyboard_check(ord("S"));

	horizontalDirection = input_right - input_left;
	verticalDirection = input_down - input_up;
	var pointing = point_direction(0, 0, horizontalDirection, verticalDirection) * pi/180;
	draw_pointing = point_direction(0, 0, horizontalDirection, verticalDirection);

	var checkForMovement = abs(horizontalDirection) + abs(verticalDirection)
	if (checkForMovement > 0) {
		xSpeed = cos(pointing) * moveSpeed;
		ySpeed = -sin(pointing) * moveSpeed;
		
		move_and_collide(xSpeed, ySpeed, currTileMap);
		/*
		#region
		// X Collision
		if place_meeting(x + xSpeed, y, currTileMap)
		{
			var _pixelCheck = sign(xSpeed);
			while !place_meeting(x+_pixelCheck, y, currTileMap)
			{
				x += _pixelCheck;
			}
	
			xSpeed = 0;
		}
		// Y Collision
		if place_meeting(x + xSpeed, y + ySpeed, currTileMap)
		{
			var _pixelCheck = sign(ySpeed);
			while !place_meeting(x+xSpeed, y+_pixelCheck, currTileMap)
			{
				y += _pixelCheck;
			}
	
			ySpeed = 0;
		}
		
		hspeed = xSpeed;
		vspeed = ySpeed;
		#endregion
		*/
		
	} else {
		hspeed = 0;
		vspeed = 0;
	}
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
	facing = sign(cos(gunAngle*pi/180)); // remove sign() part for the funny
	
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
	draw_sprite_ext(wepSprite, image_index, x, y, 1, facing, gunAngle, c_white, 1);
}

function CameraControl(){
	var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
	var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
	camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);
}