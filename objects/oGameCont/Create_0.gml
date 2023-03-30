for(var row = 0; row < room_width div 8; row++) {
	for(var column = 0; column < room_height div 8; column++) {
		tiles[row, column] = -1;	
		var ins = instance_create_depth(row * 8, column * 8, 0, oTile);
		ins.tiles = -1;
		ins.row = row;
		ins.column = column;
	}
}

for(var row = 0; row < room_width div 8; row++) {
	for(var column = 0; column < room_height div 8; column++) {
		messageBox[row, column] = JsonGetValue("message_box_0");	
	}
}

for(var sequence = 0; sequence < 6; sequence++) {
	craftList[sequence] = -1;	
}

craftSelect = 0;//0 - 5

tiles[(room_width div 8) / 2, (room_height div 8) / 2] = 1;
tiles[( (room_width div 8) / 2 ) + 1, (room_height div 8) / 2] = 1;
tiles[(room_width div 8) / 2, ( (room_height div 8) / 2 ) + 1] = 1;
tiles[( (room_width div 8) / 2 ) + 1, ( (room_height div 8) / 2 ) + 1] = 1;

select = 0;//Bag's select

craftMode = false;//Craft Mode

shift[0] = -1;//ItemID
shift[1] = -1;//ItemNumber
shift[2] = -1;//ItemPosition

craftListMax = 6;//CraftList's Max list

time = 0;//Per turn per time

depth = -100//Depth

uTime = shader_get_uniform(shNight, "u_time");

day = 0;//per 200 per day, per 200 per night