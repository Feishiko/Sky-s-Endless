if(timer >= 120) {
	shader_set(shTurnWhite);
	if(timer >= 125) {
		timer = 0;
	}
}
draw_self();
shader_reset();