if instance_number(Obj_Control) > 1 { instance_destroy();}
//if !directory_exists("saves") { directory_create("saves");}

//global.currentTileMap = layer_tilemap_get_id("Tiles_Wall");

global.debug = false;

controlLabels = ["up", "left", "down", "right", "fire", "swap", "interact"]; //7
// Add 7 to the index for gamepad light ups
controlLightUp = array_create(array_length(controlLabels)*2, false);

//1 2 3 for mouse shit
keyboardControls = [87, 65, 83, 68, 1, 32, 69];
//True for keyboard, false for mouse
keyboardType = [true, true, true, true, false, true, true];
currentI = -1;

gamepadControls = [gp_padu, gp_padl, gp_padd, gp_padr, gp_padu, gp_axislh, gp_axisrh];