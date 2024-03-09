draw_set_color(c_white);
var drawText = "";
var camera_width_half = camera_get_view_width(view_camera[0])/2;

draw_text_transformed(0, 500, chr(mb_left), 3, 3, 0);

draw_text_transformed(0, 0, "Keyboard & Mouse", 3, 3, 0);
for(var i = 0; i < array_length(controlLabels); i++) {
	if controlLightUp[i] { draw_set_color(c_red);} 
	else { draw_set_color(c_white);}
	
	if		(keyboardControls[i] == 32) { drawText = "Space";}
	else if	(keyboardControls[i] == 8) { drawText = "Backspace";}
	else if	(keyboardControls[i] == 1) { drawText = "Left Mouse";}
	else if	(keyboardControls[i] == 2) { drawText = "Right Mouse";}
	else if	(keyboardControls[i] == 3) { drawText = "Middle Mouse";}
	else { drawText = chr(keyboardControls[i]);}
	draw_text_transformed(0, 50*(i+1), controlLabels[i] + ": " + drawText, 3, 3, 0);	
}

var isConnected = (gamepad_is_connected(0) ? "Connected" : "Disconnected");
draw_text_transformed(camera_width_half, 0, "Controller (" + isConnected + ")", 3, 3, 0);
for(var i = 0; i < array_length(controlLabels); i++) {
	if gamepad_button_check(0, gp_face1) { controlLightUp[i+7] = true;}
	else { controlLightUp[i+7] = false;}
	
	if controlLightUp[i+7] { draw_set_color(c_red);} 
	else { draw_set_color(c_white);}
	
	if		(false) {drawText = "how the fuck did it get here";}
	else { drawText = string(gamepadControls[i]);}
	draw_text_transformed(camera_width_half, 50*(i+1), controlLabels[i] + ": " + drawText, 3, 3, 0);	
}

//draw_text(400, 400, gamepad_is_connected(0));