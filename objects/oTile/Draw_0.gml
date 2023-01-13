if(tiles == 3 || tiles == 5 || tiles == 7) {
	if(shineTimer >= 180) {
		shader_set(shTurnWhite);
		if(shineTimer >= 181) {
			shineTimer = 0;	
		}
	}
}

draw_self();

shader_reset();