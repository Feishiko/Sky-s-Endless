if(!vanish) {
	alpha = lerp(alpha, 1, .1);
} else {
	alpha = lerp(alpha, 0, .1);	
	if(alpha <= 0) {
		instance_destroy();	
	}
}

if(!audio_is_playing(sndPotion)) {
	vanish = true;	
}