#macro view view_camera[0]
camera_set_view_size(view, width, height);

if instance_exists(Obj_Player) {
	var halfViewWidth = camera_get_view_width(view) / 2;
	var halfViewHeight = camera_get_view_height(view) / 2;
	var xP = Obj_Player.x;
	var yP = Obj_Player.y;
	var dist = point_distance(xP, yP, mouse_x, mouse_y)/4;
	var ang = point_direction(xP, yP, mouse_x, mouse_y)*pi/180;

	var xDist = dist * cos(ang);
	var yDist = -dist * sin(ang);
	x = lerp(x, xP, 0.1);
	y = lerp(y, yP, 0.1);
	var xDistLerp = x - halfViewWidth + xDist;
	var yDistLerp = y - halfViewHeight + yDist;
	
	// Screen shake
	var xShake = random_range(-shake, shake);
	var yShake = random_range(-shake, shake);
	
	camera_set_view_pos(view, xDistLerp + xShake, yDistLerp + yShake);

	reduce = !reduce;
	if(reduce){
		shake -= shakeReduce;
		shake = clamp(shake, 0, 999999);
	}
}

if (window_has_focus()) {
    // try something
} //else display_mouse_unlock(); idk