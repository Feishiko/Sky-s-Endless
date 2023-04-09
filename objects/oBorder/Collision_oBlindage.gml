if(weaponType == 0) {
	with(other) {
		hp -= 1;
		Brick(x, y);
	}
	instance_destroy();
}

if(!collision_rectangle((mouse_x div 8)*8, (mouse_y div 8)*8, (mouse_x div 8)*8 + 7, (mouse_y div 8)*8 + 7, id, 1, 0) && instance_number(oBorder) <= 2) {
	instance_destroy();	
}