moveSpeed = 1;
xSpeed = 0;
ySpeed = 0;

contactDamage = 4;
hp = 8;

createNodePath = ds_list_create();
nodePath = ds_list_create();
currNode = id;
steppedNodes = ds_list_create();
nextNodeIndex = 0;

die = function(){
	instance_destroy();	
}

if !instance_exists(Obj_Sensor) { instance_create_depth(x, y, 10, Obj_Sensor);}