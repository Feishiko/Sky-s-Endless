for(var row = 0; row < room_width div 8; row++) {
	for(var column = 0; column < room_height div 8; column++) {
		bfsGrid[row, column] = -1;
	}	
}

gridX = x div 8;
gridY = y div 8;

type = 0;// type = 0/1/2

// If after rainy
if(oGameCont.day >= 2) {
	if(irandom(8) > 6) {
		type += 1;	
	}
}

if(!type) {
	hp = 2;
} else {
	hp = 1;	
}

if(type == 1) {
	sprite_index = sMonster2;	
}

angle = 0;
attackTimer = 0;

attack = false;//Play attack animation and attack
attackTarget = -1;
attackType = 0;//0 - Player, 1 - Blindeage

audio_play_sound(sndEnemy, 50, false);

//turned = false;