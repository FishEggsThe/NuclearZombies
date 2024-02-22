var facing = sign(cos(direction*pi/180)); // remove sign() part for the funny
draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, 0, c_white, 1);
draw_set_colour(c_black);
draw_text_transformed(x, y, hp, 3, 3, 0);