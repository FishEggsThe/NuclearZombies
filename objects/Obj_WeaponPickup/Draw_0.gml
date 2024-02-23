//draw_ellipse(x-xShadow, y-yShadow, x+xShadow, y+yShadow, false);
draw_sprite(gunSprite, 0, x, y-gunRaise);
draw_set_color(c_white);
if inRange { draw_text(x, y, "Press 'E' to pickup");}
inRange = false;