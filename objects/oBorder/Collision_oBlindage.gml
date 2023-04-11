if(weaponType == 0) {
	/*with(other) {
		hp -= 1 + self.doubledPistol;
		Brick(x, y);
	}*/
	other.hp -= 1*(1 + doubledPistol)*(1 + doubledBullet);
	if(explode) {
		instance_create_depth(x, y, -20, oLightCircle);	
	}
	Brick(other.x, other.y);
	instance_destroy();
}

if(!collision_rectangle((mouse_x div 8)*8, (mouse_y div 8)*8, (mouse_x div 8)*8 + 7, (mouse_y div 8)*8 + 7, id, 1, 0) && instance_number(oBorder) <= 2) {
	instance_destroy();	
}