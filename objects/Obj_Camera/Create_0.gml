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

/*
- Create
lock = false;

- Begin Step
mouse_lock_update();

- Step
if (mouse_is_locked()) {
    x += mouse_delta_x;
    y += mouse_delta_y;
    // wrap:
    if (x > room_width + 25) x -= room_width + 50;
    if (x < -25) x += room_width + 50;
    if (y > room_height + 25) y -= room_height + 50;
    if (y < -25) y += room_height + 50;
}

- On Mousle Left Click
lock = !lock;
if (lock) {
    mouse_lock();
} else mouse_unlock();
*/