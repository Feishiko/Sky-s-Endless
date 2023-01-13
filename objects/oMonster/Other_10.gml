//Time Passed
//with the blindage will be delete later, just for test
if(hp > 0) {
	for(var row = 0; row < room_width div 8; row++) {
		for(var column = 0; column < room_height div 8; column++) {
			bfsGrid[row, column] = -1;
		}	
	}
	with(oBlindage) {
		//oMonster.bfsGrid[gridX, gridY] = 0;	
	}
	with(oMonster) {
		bfsGrid[gridX, gridY] = 0;
	}
	bfsGrid[gridX, gridY] = -1;
	//turned = false;

	//Attack Player
	var left = collision_point(x - 8, y, oPlayer, 1, 1);
	var right = collision_point(x + 8, y, oPlayer, 1, 1);
	var up = collision_point(x, y - 8, oPlayer, 1, 1);
	var down = collision_point(x, y + 8, oPlayer, 1, 1);
	if(left || right || up || down) {
		attack = true;
		if(left) {
			attackTarget = left;
		}else if(right) {
			attackTarget = right;	
		}else if(up) {
			attackTarget = up;
		}else if(down) {
			attackTarget = down;	
		}
		attackType = 0;
		exit;
	}

	//Attack Blindage
	var left = collision_point(x - 8, y, oBlindage, 1, 1);
	var right = collision_point(x + 8, y, oBlindage, 1, 1);
	var up = collision_point(x, y - 8, oBlindage, 1, 1);
	var down = collision_point(x, y + 8, oBlindage, 1, 1);
	if(left || right || up || down) {
		attack = true;
		if(left) {
			attackTarget = left;
		}else if(right) {
			attackTarget = right;	
		}else if(up) {
			attackTarget = up;
		}else if(down) {
			attackTarget = down;	
		}
		if(attackTarget.hp > 0){
			attackType = 1;
			exit;
		}
	}
	
	gridX = clamp(gridX, 0, (room_width div 8) - 1);
	gridY = clamp(gridY, 0, (room_height div 8) - 1);
	
	BFSFindRoad(bfsGrid, (room_width div 8) - 1, (room_height div 8) - 1, gridX, gridY, oPlayer.gridX, oPlayer.gridY, true);
}