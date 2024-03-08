moveSpeed = 1;
xSpeed = 0;
ySpeed = 0;

contactDamage = 4;
hp = 8;
hitFlash = 0;
hitFlashSet = 5;

createNodePath = ds_list_create();
//createNodePath = ds_map_create();
//nodeLine = ds_list_create();

nodePath = ds_list_create();
steppedNodes = ds_list_create();

currNode = id;
nextNodeIndex = 0;
playersLastNearestNode = noone;

drawColor = c_white;

die = function(){
	instance_destroy();	
}

if !instance_exists(Obj_Sensor) { instance_create_depth(x, y, 10, Obj_Sensor);}