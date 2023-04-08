if(room = rmDeath) {
	showTimer++;
	draw_set_font(fontPixelMenu);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if(showTimer >= 60) {
		draw_text(room_width/2, 40, "You lived " +  string(time) + " turns");
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
		draw_text(room_width/2, 120, "You killed " + string(monsterKilled[0]));
		draw_sprite_ext(sMonster, -1, room_width/2 + string_length("You killed " + string(monsterKilled[0])) + 70, 120, 4, 4, 0, c_white, 1);
	}
	if(showTimer >= 240) {
		draw_text(room_width/2, 160, "You killed " + string(monsterKilled[1]));
		draw_sprite_ext(sMonster2, -1, room_width/2 + string_length("You killed " + string(monsterKilled[1]))/2 + 70, 160, 4, 4, 0, c_white, 1);
	}
	if(showTimer >= 300) {
		draw_text(room_width/2, 200, "You killed " + string(monsterKilled[2]));
		draw_sprite_ext(sMonster3, -1, room_width/2 + string_length("You killed " + string(monsterKilled[2]))/2 + 70, 200, 4, 4, 0, c_white, 1);
	}
	if(showTimer >= 600) {
		game_restart();
	}
}