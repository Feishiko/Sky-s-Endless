if(type != 1) {
	if(hp > 0) {
		shader_set(shRedCover);
		draw_sprite_ext(sprite_index, -1, x, y, 1.1, 1.1, image_angle, c_white, image_alpha);
		shader_reset();
	}
	draw_self();	
} else {
	if(collision_circle(x, y, 8, oBlindage, 1, 1) || collision_circle(x, y, 8, oPlayer, 1, 1)) {
		if(hp > 0) {
			shader_set(shRedCover);
			draw_sprite_ext(sprite_index, -1, x, y, 1.1, 1.1, image_angle, c_white, image_alpha);
			shader_reset();
		}
		draw_self();	
	}
}