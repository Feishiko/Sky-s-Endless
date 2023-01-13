if(hp > 0) {
	image_xscale = lerp(image_xscale, 1, .1);
	image_yscale = lerp(image_yscale, 1, .1);	
}else {
	image_xscale = lerp(image_xscale, 0, .1);
	image_yscale = lerp(image_yscale, 0, .1);	
	deadTimer++;
	if(deadTimer >= 10) {
		instance_destroy();	
	}
}	

//Corner
var left = collision_point(x - 8, y, oBlindage, 1, 1);
var right = collision_point(x + 8, y, oBlindage, 1, 1);
var up = collision_point(x, y - 8, oBlindage, 1, 1);
var down = collision_point(x, y + 8, oBlindage, 1, 1);

if(!corner) {
	//↘
	if(left && up) {
		var blindage1 = instance_create_depth(x, y, -20, oBlindage);
		var blindage2 = instance_create_depth(x, y, -20, oBlindage);
		blindage1.image_angle = 0;
		blindage2.image_angle = 270;
		blindage1.corner = true;
		blindage2.corner = true;
		instance_destroy();
	}

	//↙
	if(right && up) {
		var blindage1 = instance_create_depth(x, y, -20, oBlindage);
		var blindage2 = instance_create_depth(x, y, -20, oBlindage);
		blindage1.image_angle = 180;
		blindage2.image_angle = 270;
		blindage1.corner = true;
		blindage2.corner = true;
		instance_destroy();
	}

	//↖
	if(down && right) {
		var blindage1 = instance_create_depth(x, y, -20, oBlindage);
		var blindage2 = instance_create_depth(x, y, -20, oBlindage);
		blindage1.image_angle = 180;
		blindage2.image_angle = 90;
		blindage1.corner = true;
		blindage2.corner = true;
		instance_destroy();
	}

	//↗
	if(left && down) {
		var blindage1 = instance_create_depth(x, y, -20, oBlindage);
		var blindage2 = instance_create_depth(x, y, -20, oBlindage);
		blindage1.image_angle = 0;
		blindage2.image_angle = 90;
		blindage1.corner = true;
		blindage2.corner = true;
		instance_destroy();
	}
}