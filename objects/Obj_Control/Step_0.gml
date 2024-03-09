if keyboard_check_pressed(ord("J")) { room_goto_next();}
if keyboard_check_pressed(ord("P")) { global.debug = !global.debug;}

if(room == Rm_Menu)
{
	if currentI > -1 {
		if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
			if keyboard_check_pressed(vk_anykey) {
				var keyExists = false;
				for(var i = 0; i < array_length(controlLabels); i++) {
					if keyboardControls[i] == keyboard_key { keyExists = true;}
				}
				
				if !keyExists {
					keyboardControls[currentI] = keyboard_key;
					keyboardType[currentI] = true;
				}
				controlLightUp[currentI] = false;
			}
			else if mouse_check_button_pressed(mb_any) {
				var keyExists = false;
				for(var i = 0; i < array_length(controlLabels); i++) {
					if keyboardControls[i] == mouse_button { keyExists = true;}
				}
				
				if !keyExists {
					keyboardControls[currentI] = mouse_button;
					keyboardType[currentI] = false;
				}
				controlLightUp[currentI] = false;
			}
			currentI = -1;
		}
	}
	
	else if keyboard_check_pressed(vk_anykey) {
		for (var i = 0; i < array_length(controlLabels); i++) {
			if keyboardControls[i] == keyboard_key
				{ controlLightUp[i] = true; currentI = i;}
			else
				{ controlLightUp[i] = false;}
		}
	}
	
	else if mouse_check_button_pressed(mb_any) {
		for (var i = 0; i < array_length(controlLabels); i++) {
			if keyboardControls[i] == mouse_button
				{ controlLightUp[i] = true; currentI = i;}
			else
				{ controlLightUp[i] = false;}
		}
	}
}