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
		hspeed = xSpeed;
		vspeed = ySpeed;
	} else {
		hspeed = 0;
		vspeed = 0;
	}
}

function FireWeapon(){
	var input_fired =  mouse_check_button_pressed(mb_left);
	UpdateWeapon();
	
	if (input_fired) { fire_weapon(); }
}

function DrawPlayer(){
	if horizontalDirection != 0 {facing = horizontalDirection;}
	
	draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
}

function CameraControl(){
	var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
	var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
	camera_set_view_pos(view_camera[0], x - halfViewWidth, y - halfViewHeight);
}