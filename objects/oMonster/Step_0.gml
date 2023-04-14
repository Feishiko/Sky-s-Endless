if(!attack) {
	x = lerp(x, gridX*8 + 4, .1);
	y = lerp(y, gridY*8 + 4, .1);
}

if(!instance_exists(oNight)) {
	hp = 0;	
}

if(hp <= 0) {
	image_xscale = lerp(image_xscale, 0, .1);	
	image_yscale = lerp(image_yscale, 0, .1);	
	if(image_xscale == 0) {
		oGameCont.monsterKilled[type] += 1;
		instance_destroy();	
	}
}

image_angle = lerp(image_angle, angle, .1);

/*
if(!turned) {
	//right
	if(gridX*8 + 4 > x) {
		angle = 0;	
		turned = true;
	}
	//left
	if(gridX*8 + 4 < x) {
		angle = 180;	
		turned = true;
	}
	//up
	if(gridY*8 + 4 < y) {
		angle = 90;	
		turned = true;
	}
	//down
	if(gridY*8 + 4 > y) {
		angle = 270;	
		turned = true;
	}
}
*/

//Attack
if(attack) {
	attackTimer++;
	var dir = point_direction(x, y, attackTarget.x, attackTarget.y);
	angle = dir;
	x = lerp(x, attackTarget.x, .2);
	y = lerp(y, attackTarget.y, .2);
	if(attackTimer >= 5) {
		if(attackType == 0) {
			oCamera.viewWidth = 24;
			oCamera.viewHeight = 24;
			oCamera.backTimer = 0;
			with(oPlayer) {
				Blood(x, y);	
			}
		}else {
			with(attackTarget) {
				Brick(x, y);	
			}
		}
		attackTarget.hp -= 1;
		attackTimer = 0;
		attack = false;	
	}
}