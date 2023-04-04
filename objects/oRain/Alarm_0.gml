repeat(2) {
	with(oTile) {
		if(tiles != -1) {
			instance_create_depth(x + random(7), y + random(7), -10, oRainDot);	
		}
	}
}
alarm[0] = 4;