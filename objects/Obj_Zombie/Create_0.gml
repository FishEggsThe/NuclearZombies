moveSpeed = 1;
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