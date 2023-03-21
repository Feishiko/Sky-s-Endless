//Environment
shader_set(shNight);
shader_set_uniform_f(uTime, time*((3.14/400)));
draw_surface(application_surface, 0, 0);
shader_reset();

if(oPlayer.hp > 0) {

	FontSet("small");

	if(global.language == 0) {

		draw_rectangle_color(20, 20 + select*10, 86, 20 + select*10 + 6, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(18, room_height - 20, room_width - 20, room_height - 14, c_black, c_black, c_black, c_black, false);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_text(20, room_height - 20, JsonGetValue("hitpoint") + " " + string(oPlayer.hp) + "/" + string(oPlayer.hpMax));
		if(day mod 1 != 0) {
			draw_set_color(c_yellow);	
		}
		draw_text(80, room_height - 20, JsonGetValue("time") + " " + string(time));
		draw_set_color(c_white);
		draw_text(120, room_height - 20, string(messageBox[clamp(mouse_x div 8, 0, (room_width div 8) - 1), clamp(mouse_y div 8, 0, (room_height div 8) - 1)]));
		draw_set_color(c_black);
		for(var itemsNumber = 0; itemsNumber < 10; itemsNumber++) {
			draw_text(20, 20 + itemsNumber * 10, string(itemsNumber + 1) + ".");
			draw_text(30, 20 + itemsNumber * 10, ItemGetName(oPlayer.items[itemsNumber, 0], itemsNumber))
			draw_set_color(c_black);
		}
		//Craft Mode
		if(craftMode) {
			draw_rectangle_color(89, 20 + craftSelect * 10, room_width, 20 + craftSelect * 10 + 6, c_black, c_black, c_black, c_black, false);
			draw_set_color(c_white);
			for(var sequence = 0; sequence < 6; sequence++) {
				switch(craftList[sequence]) {
					case 6: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_1"));break;
					case 7: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_2"));break;
					case 8: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_3"));break;
					case 9: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_4"));break;
					case 10: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_5"));break;
					case 11: draw_text(90, 20 + sequence * 10, JsonGetValue("craft_list_6"));break;
					default: draw_text(90, 20 + sequence * 10, "");break;
				}
			}
		}
		
	} else {
		
		draw_rectangle_color(20, 20 + select*14, 86, 20 + select*14 + 10, c_white, c_white, c_white, c_white, false);
		draw_rectangle_color(18, room_height - 20, room_width - 20, room_height - 8, c_black, c_black, c_black, c_black, false);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		draw_text(20, room_height - 20, JsonGetValue("hitpoint") + " " + string(oPlayer.hp) + "/" + string(oPlayer.hpMax));
		if(day mod 1 != 0) {
			draw_set_color(c_yellow);	
		}
		draw_text(80, room_height - 20, JsonGetValue("time") + " " + string(time));
		draw_set_color(c_white);
		draw_text(120, room_height - 20, string(messageBox[clamp(mouse_x div 8, 0, (room_width div 8) - 1), clamp(mouse_y div 8, 0, (room_height div 8) - 1)]));
		draw_set_color(c_black);
		for(var itemsNumber = 0; itemsNumber < 10; itemsNumber++) {
			draw_text(20, 20 + itemsNumber * 14, string(itemsNumber + 1) + ".");
			draw_text(30, 20 + itemsNumber * 14, ItemGetName(oPlayer.items[itemsNumber, 0], itemsNumber))
			draw_set_color(c_black);
		}
		//Craft Mode
		if(craftMode) {
			draw_rectangle_color(89, 20 + craftSelect * 14, room_width, 20 + craftSelect * 14 + 10, c_black, c_black, c_black, c_black, false);
			draw_set_color(c_white);
			for(var sequence = 0; sequence < 6; sequence++) {
				switch(craftList[sequence]) {
					case 6: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_1"));break;
					case 7: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_2"));break;
					case 8: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_3"));break;
					case 9: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_4"));break;
					case 10: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_5"));break;
					case 11: draw_text(90, 20 + sequence * 14, JsonGetValue("craft_list_6"));break;
					default: draw_text(90, 20 + sequence * 14, "");break;
				}
			}
		}
		
	}
	
	draw_set_color(c_white);
}

//draw_text(0, 0, keyboard_lastkey);