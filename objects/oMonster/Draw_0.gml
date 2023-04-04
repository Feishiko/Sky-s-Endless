if(type != 1) {
	draw_self();	
} else {
	if(collision_circle(x, y, 8, oBlindage, 1, 1) || collision_circle(x, y, 8, oPlayer, 1, 1)) {
		draw_self();	
	}
}