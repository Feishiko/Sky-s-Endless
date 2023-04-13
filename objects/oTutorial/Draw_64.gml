if(!global.tutorial) {
	if(oGameCont.time <= 5){
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		DrawOutline(20, room_height/2 + 10 + sin(current_time/200)*2, JsonGetValue("tutorial_1"), c_white, c_black);	
	}
	if(oGameCont.time >= 1 && oGameCont.time <= 5) {
		//draw_rectangle_color(80, room_height - 20, 100, room_height - 8, c_white, c_white, c_white, c_white, true);
		draw_set_color(c_black);
		draw_arrow(90, room_height - 45 + sin(current_time/200)*5, 90, room_height - 30 + sin(current_time/200)*5, 8);
	}
	if(oGameCont.time >= 6 && !nextStep[0]) {
		draw_set_halign(fa_right);
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_2"), c_white, c_black);	
		if(tutoTiles >= 2) {
			nextStep[0] = true;
		}
	}
	if(nextStep[0] && tutoTiles < 4) {
		draw_set_halign(fa_right);
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_3"), c_white, c_black);	
	}
	if(tutoTiles >= 4 && !nextStep[1]) {
		DrawOutline(20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_4"), c_white, c_black);	
		if(instance_exists(oHarvest)) {
			nextStep[1] = true;
		}
	}
	if(nextStep[1] && !nextStep[2]) {
		DrawOutline(20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_5"), c_white, c_black);
		if(ItemExists(1, 1) || ItemExists(3, 1) || ItemExists(5, 1)) {
			nextStep[2] = true;	
		}
	}
	if(nextStep[2] && !nextStep[3]) {
		draw_set_halign(fa_right);
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_6"), c_white, c_black);
		if(ItemExists(6, 1) && ItemExists(7, 1)) {
			nextStep[3] = true;	
		}
	}
	if(nextStep[3] && !nextStep[4]) {
		draw_set_halign(fa_right);
		draw_set_color(c_black);
		draw_arrow(100 + sin(current_time/100)*2, 25, 85 + sin(current_time/100)*2, 25, 8);
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_7"), c_white, c_black);
		if(oPlayer.items[0, 0] == 6) {
			nextStep[4] = true;	
		}
	}
	if(nextStep[4]) {
		draw_set_halign(fa_right);
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("tutorial_8"), c_white, c_black);
		if(instance_exists(oHelp)) {
			var file = file_text_open_write("tutorial");
			file_text_write_real(file, true);
			file_text_close(file);
			instance_destroy();	
		}
	}
}