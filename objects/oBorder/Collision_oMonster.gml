if(weaponType == 0) {
	with(other) {
		hp -= 1;
		Brick(x, y);
	}
	instance_destroy();
}

if(weaponType == 1) {
	with(other) {
		hp -= 2;
		Brick(x, y);
	}
	instance_destroy();
}

if(!collision_point(mouse_x, mouse_y, id, 1, 0) && weaponType != 1) {
	instance_destroy();	
}