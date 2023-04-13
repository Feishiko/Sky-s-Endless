shader_set(shBlueCover);
draw_sprite_ext(sprite_index, -1, x, y, 1.15, 1.15, image_angle, c_white, image_alpha);
shader_reset();

draw_self();