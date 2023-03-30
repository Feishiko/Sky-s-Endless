if(weaponType == 0) {
	with(other) {
		hp -= 1;
		Brick(x, y);
	}
	instance_destroy();
}