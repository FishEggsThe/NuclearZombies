if instance_number(Obj_Control) > 1 { instance_destroy();}
//if !directory_exists("saves") { directory_create("saves");}

//global.currentTileMap = layer_tilemap_get_id("Tiles_Wall");

global.debug = false;

controlLabels = ["Up", "Left", "Down", "Right", "Fire", "Swap", "Interact"]; //7
controlLightUp = array_create(array_length(controlLabels), false);

//1 2 3 for mouse shit
keyboardControls = [87, 65, 83, 68, 1, 32, 69];
//True for keyboard, false for mouse
keyboardType = [true, true, true, true, false, true, true];
currentI = -1;