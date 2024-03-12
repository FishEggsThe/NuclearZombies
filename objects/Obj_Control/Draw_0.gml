draw_set_color(c_white);
var drawText = "";
var camera_width_half = camera_get_view_width(view_camera[0])/2;

draw_text_transformed(0, 500, chr(mb_left), 3, 3, 0);

var scale = 1;

draw_text_transformed(0, 0, "Keyboard & Mouse", scale, scale, 0);
for(var i = 0; i < array_length(controlLabels); i++) {
	if controlLightUp[i] { draw_set_color(c_red);} 
	else { draw_set_color(c_white);}
	
	drawText = KeyboardGetKey(i);
	draw_text_transformed(0, 20*(i+1), controlLabels[i] + ": " + drawText, scale, scale, 0);	
}

var isConnected = (gamepad_is_connected(0) ? "Connected" : "Disconnected");
draw_text_transformed(camera_width_half, 0, "Controller (" + isConnected + ")", scale, scale, 0);
for(var i = 0; i < array_length(controlLabels); i++) {
	if gamepad_button_check(0, gp_face1) { controlLightUp[i+7] = true;}
	else { controlLightUp[i+7] = false;}
	
	if controlLightUp[i+7] { draw_set_color(c_red);} 
	//else { draw_set_color(c_white);}
	
	if		(false) {drawText = "how the fuck did it get here";}
	else { drawText = string(gamepadControls[i]);}
	draw_text_transformed(camera_width_half, 20*(i+1), controlLabels[i] + ": " + drawText, scale, scale, 0);	
}

//draw_text(400, 400, gamepad_is_connected(0));