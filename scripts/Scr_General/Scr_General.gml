function UseSensor(x1, y1, x2, y2){
	Obj_Sensor.touching = false;
	Obj_Sensor.x = x1;
	Obj_Sensor.y = y1;
	Obj_Sensor.image_angle = point_direction(x1, y1, x2, y2);
	Obj_Sensor.image_xscale = point_distance(x1, y1, x2, y2);
		
	with(Obj_Sensor) {
		if place_meeting(x, y, layer_tilemap_get_id("Tiles_Wall")) { touching = true;}
	}
	
	return Obj_Sensor.touching;
}