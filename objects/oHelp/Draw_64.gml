FontSet("small");
draw_set_halign(fa_right);
draw_set_valign(fa_top);
if(global.language == 0){
	draw_rectangle_color(room_width - 136, 160, room_width - 20, room_height - 27, c_black, c_black, c_black, c_black, false);

	draw_set_color(c_white);

	draw_text(room_width - 20, 160, JsonGetValue("help"))
}else {
	draw_rectangle_color(room_width - 136, 120, room_width - 20, room_height - 27, c_black, c_black, c_black, c_black, false);

	draw_set_color(c_white);

	draw_text(room_width - 20, 120, JsonGetValue("help"))	
}

draw_set_color(c_white);