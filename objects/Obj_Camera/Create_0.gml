if instance_number(Obj_Camera) > 1 { instance_destroy();}

width = 640;
height = 480;
scale = 2;

window_set_size(width*scale, height*scale);
alarm[0] = 1;

surface_resize(application_surface, width*scale, height*scale);

hpWidth = 200;
hpHeight = 80;
hpBorder = 10;

shake = 0;
shakeReduce = 1.5;
reduce = false;

global.shake_screen = function(sVal) {
	shake += sVal;
}