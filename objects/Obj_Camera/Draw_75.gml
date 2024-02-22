var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

var crosshairX = device_mouse_x_to_gui(0);
var crosshairY = device_mouse_y_to_gui(0);

var player = Obj_Player;
var playerHealth = player.hp/player.maxHP;

draw_set_color(c_black);
draw_rectangle(hpBorder, hpBorder, hpBorder+hpWidth, hpBorder+hpHeight, false);
draw_set_color(c_red);
draw_rectangle(2*hpBorder, 2*hpBorder, hpWidth*playerHealth, hpHeight, false);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
var printThis = string(player.hp) + "/" + string(player.maxHP);
draw_text_transformed((hpBorder+hpWidth)/2, hpBorder+hpHeight/2, printThis, 3, 3, 0);
draw_sprite_ext(Spr_TestBullet, 0, crosshairX, crosshairY, 2, 2, 0, c_red, 1);