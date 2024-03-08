//depth = 100;
if !instance_exists(Obj_Sensor) { instance_create_depth(x, y, 10, Obj_Sensor);}

connections = ds_list_create();
//edges = ds_list_create();

for(var i = 0; i < instance_number(Obj_Node); ++i;)
{
	var currNode = instance_find(Obj_Node,i);
	var arr = [Obj_Node, layer_tilemap_get_id("Tiles_Wall")]
	
	var ang = point_direction(x, y, currNode.x, currNode.y) * pi/180;
	var buffer = 12;
	var xBuffer = cos(ang) * buffer;
	var yBuffer = -sin(ang) * buffer;
	var trueConnect = UseSensor(x+xBuffer, y+yBuffer, currNode.x-xBuffer, currNode.y-yBuffer, 0.3);
	var nodeConnect = UseSensorNode(x+xBuffer, y+yBuffer, currNode.x-xBuffer, currNode.y-yBuffer, 0.4);
	

    if(currNode != self && !trueConnect && !nodeConnect) {
		ds_list_add(connections, currNode);
		//ds_list_add(edges, point_distance(x, y, currNode.x, currNode.y));
	}
}

draw_nodes = function() {
	draw_sprite(sprite_index, image_index, x, y);
	draw_set_colour(c_red);
	draw_text(x, y, ds_list_size(connections));
	//draw_text(x, y, realName);

	for(var i = 0; i < ds_list_size(connections); i++) {
		var item = ds_list_find_value(connections,i);
		draw_set_colour(c_black);
		draw_line_width(x, y, item.x, item.y, 5);
	}
}