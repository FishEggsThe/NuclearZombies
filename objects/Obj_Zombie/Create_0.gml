moveSpeed = 1;
contactDamage = 4;
hp = 8;
nodePath = ds_list_create();
currNode = id;
steppedNodes = ds_list_create();

die = function(){
	instance_destroy();	
}