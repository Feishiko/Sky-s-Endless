if(createTimer >= createTime) {
	//Create Monster
	var createDirection = irandom_range(0, 3);
	//Right
	if(createDirection == 0) {
		instance_create_depth((room_width div 8)*8 + 4 - 8, irandom_range(1, (room_height div 8) - 1)*8 + 4, -10, oMonster);	
	}
	//Left
	if(createDirection == 1) {
		instance_create_depth(4 + 8, irandom_range(1, (room_height div 8) - 1)*8 + 4, -10, oMonster);	
	}
	//Up
	if(createDirection == 2) {
		instance_create_depth(irandom_range(1, (room_width div 8) - 1)*8 + 4, 4 + 8, -10, oMonster);	
	}
	//Down
	if(createDirection == 3) {
		instance_create_depth(irandom_range(1, (room_width div 8) - 1)*8 + 4, (room_height div 8)*8 + 4 - 8, -10, oMonster);	
	}
	createTimer = 0;
}