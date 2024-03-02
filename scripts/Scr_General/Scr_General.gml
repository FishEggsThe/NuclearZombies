function UseSensor(x1, y1, x2, y2, wdth){
	Obj_Sensor.touching = false;
	Obj_Sensor.x = x1;
	Obj_Sensor.y = y1;
	Obj_Sensor.image_angle = point_direction(x1, y1, x2, y2);
	Obj_Sensor.image_xscale = point_distance(x1, y1, x2, y2);
	//var ww, hh;
	//ww = sprite_get_bbox_left(spr) - sprite_get_bbox_right(spr);
	//hh = sprite_get_bbox_bottom(spr) - sprite_get_bbox_top(spr);
	Obj_Sensor.image_yscale = wdth;//sqrt(sqr(ww) + sqr(hh)) / sprite_get_height(Spr_Collision);
		
	with(Obj_Sensor) {
		if place_meeting(x, y, layer_tilemap_get_id("Tiles_Wall")) { touching = true;}
	}
	
	return Obj_Sensor.touching;
}