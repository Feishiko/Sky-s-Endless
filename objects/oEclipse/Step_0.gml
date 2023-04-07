alpha = lerp(alpha, 1*!eclipse, .1);

if(alpha >= 1) {
	eclipse = true;	
	if(instance_exists(oRain)) {
		instance_destroy(oRain);	
	}
}