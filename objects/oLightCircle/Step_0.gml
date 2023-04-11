if(!vanish) {
	r = lerp(r, 16, .5);	
} else {
	r = lerp(r, 0, .5);
	if(r <= 0.1) {
		instance_destroy();	
	}
}

if(r >= 15) {
	vanish = true;	
}