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

if(weaponType == 1) {
	
	other.hp -= 2*(1 + doubledGrenade);
	Brick(other.x, other.y);
	if(explode) {
		instance_create_depth(x, y, -20, oLightCircle);	
	}
	instance_destroy();
}

if(weaponType == -1) {
	if(instance_number(oBorder) <= 2) {
		if(!collision_rectangle((mouse_x div 8)*8, (mouse_y div 8)*8, (mouse_x div 8)*8 + 7, (mouse_y div 8)*8 + 7, id, 1, 0)) {
			instance_destroy();	
		}
	} else {
		if(collision_rectangle(((mouse_x div 8) - 1)*8, (mouse_y div 8)*8, ((mouse_x div 8) - 1)*8 + 7, (mouse_y div 8)*8 + 7, oBorder, 1, 0)) {
			if(collision_rectangle(((mouse_x div 8) + 1)*8, (mouse_y div 8)*8, ((mouse_x div 8) + 1)*8 + 7, (mouse_y div 8)*8 + 7, oBorder, 1, 0)) {
				if(collision_rectangle(((mouse_x div 8))*8, ((mouse_y div 8) - 1)*8, ((mouse_x div 8))*8 + 7, ((mouse_y div 8) - 1)*8 + 7, oBorder, 1, 0)) {
					if(collision_rectangle(((mouse_x div 8))*8, ((mouse_y div 8) + 1)*8, ((mouse_x div 8))*8 + 7, ((mouse_y div 8) + 1)*8 + 7, oBorder, 1, 0)) {
		
					} else {
						with(oBorder) {
							instance_destroy();	
						}
					}
					} else {
							with(oBorder) {
								instance_destroy();	
							}
						}
					} else {
								with(oBorder) {
									instance_destroy();	
								}
							}
					} else {
									with(oBorder) {
										instance_destroy();	
									}
								}
				}
}