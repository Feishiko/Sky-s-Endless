tiles = oGameCont.tiles[row, column];

shineTimer++;

if(tiles == -1) {
	visible = false;
}else {
	visible = true;
	image_index = tiles;
}

if(tiles == 2 || tiles == 4 || tiles == 6) {
	if(growthTo == 0) {
		growthTo = irandom_range(25, 30);
		growth = 0;
	}
	
	if(growth > growthTo) {
		growthTo = 0;
		growth = 0;
		tiles += 1;
		oGameCont.tiles[row, column] = tiles;
		repeat(8) {
			instance_create_depth(x + 4, y + 4, -20, oHarvest);	
		}
	}
}