draw_set_color(c_white);
var drawText = "";

draw_text_transformed(0, 500, chr(mb_left), 3, 3, 0);

for(var i = 0; i < array_length(controlLabels); i++) {
	if controlLightUp[i] { draw_set_color(c_red);} 
	else { draw_set_color(c_white);}
	
	if		(keyboardControls[i] == 32) { drawText = "Space";}
	else if	(keyboardControls[i] == 8) { drawText = "Backspace";}
	else if	(keyboardControls[i] == 1) { drawText = "Left Mouse";}
	else if	(keyboardControls[i] == 2) { drawText = "Right Mouse";}
	else if	(keyboardControls[i] == 3) { drawText = "Middle Mouse";}
	else { drawText = chr(keyboardControls[i]);}
	draw_text_transformed(0, 0+50*i, controlLabels[i] + ": " + drawText, 3, 3, 0);	
}