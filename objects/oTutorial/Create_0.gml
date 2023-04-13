depth = -500;
nextStep[0] = false;
nextStep[1] = false;
nextStep[2] = false;
nextStep[3] = false;
nextStep[4] = false;
tutoTiles = 0;
if(!global.tutorial) {
	if(instance_exists(oHelp)) {
		with(oHelp) {
			instance_destroy();	
		}
	}
} else {
	instance_destroy();	
}