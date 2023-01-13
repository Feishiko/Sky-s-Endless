if(room = rmDeath) {
	showTimer++;
	draw_set_font(fontPixelMenu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if(showTimer >= 60) {
		draw_text(room_width/2, 40, "You are dead");
	}
	if(showTimer >= 120) {
		if(day <= 1) {
			draw_text(room_width/2, 80, "You lived " + string(floor(day)) + " day");
		}
		if(day >= 2) {
			draw_text(room_width/2, 80, "You lived " + string(floor(day)) + " days");
		}
	}
	if(showTimer >= 180) {
		draw_text(room_width/2, 120, "Made for LD52");
	}
	if(showTimer >= 240) {
		draw_text(room_width/2, 160, "All by Feishiko");
	}
	if(showTimer >= 300) {
		draw_text(room_width/2, 200, "Made with \nGameMaker Studio 2");
	}
	if(showTimer >= 600) {
		game_restart();
	}
}