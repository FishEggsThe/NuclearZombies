DrawPlayer();

draw_set_colour(c_black);
draw_text_transformed(x, y, loadout[0], 3, 3, 0);
draw_text_transformed(x, y+50, loadout[1], 3, 3, 0);
draw_text_transformed(x, y+100, perkList[0], 3, 3, 0);