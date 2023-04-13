//Blindage
if(guidence[0] && guidenceTurn[0] != 0) {
	if(oGameCont.time <= guidenceTurn[0]) {
		draw_set_halign(fa_right);	
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("guidence_1"), c_white, c_black);
	} else {
		var file = file_text_open_write("guidence");
		file_text_write_real(file, guidence[0]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[1]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[2]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[3]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[4]);
		file_text_close(file);
		guidenceTurn[0] = 0;
	}
}

//Bread
if(guidence[1] && guidenceTurn[1] != 0) {
	if(oGameCont.time <= guidenceTurn[1]) {
		draw_set_halign(fa_right);	
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("guidence_2"), c_white, c_black);
	} else {
		var file = file_text_open_write("guidence");
		file_text_write_real(file, guidence[0]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[1]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[2]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[3]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[4]);
		file_text_close(file);
		guidenceTurn[1] = 0;
	}
}

//Plough
if(guidence[2] && guidenceTurn[2] != 0) {
	if(oGameCont.time <= guidenceTurn[2]) {
		draw_set_halign(fa_right);	
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("guidence_3"), c_white, c_black);
	} else {
		var file = file_text_open_write("guidence");
		file_text_write_real(file, guidence[0]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[1]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[2]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[3]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[4]);
		file_text_close(file);
		guidenceTurn[2] = 0;
	}
}

//Grenade
if(guidence[3] && guidenceTurn[3] != 0) {
	if(oGameCont.time <= guidenceTurn[3]) {
		draw_set_halign(fa_right);	
		DrawOutline(room_width - 20, room_height/2 + 60 + sin(current_time/200)*2, JsonGetValue("guidence_4"), c_white, c_black);
	} else {
		var file = file_text_open_write("guidence");
		file_text_write_real(file, guidence[0]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[1]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[2]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[3]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[4]);
		file_text_close(file);
		guidenceTurn[3] = 0;
	}
}

//Potion
if(guidence[4] && guidenceTurn[4] != 0) {
	if(oGameCont.time <= guidenceTurn[4]) {
		draw_set_halign(fa_right);	
		DrawOutline(room_width - 20, room_height/2 + 20 + sin(current_time/200)*2, JsonGetValue("guidence_5"), c_white, c_black);
	} else {
		var file = file_text_open_write("guidence");
		file_text_write_real(file, guidence[0]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[1]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[2]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[3]);
		file_text_writeln(file);
		file_text_write_real(file, guidence[4]);
		file_text_close(file);
		guidenceTurn[4] = 0;
	}
}