if(speed <= 0) {
	deadTimer++;
	
	if(deadTimer >= 30) {
		image_alpha = 1 - deadTimer/30;
		instance_destroy();	
	}
}