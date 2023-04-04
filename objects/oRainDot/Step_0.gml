timer = lerp(timer, 0, .2);

if(timer <= 0.01) {
	instance_destroy();	
}