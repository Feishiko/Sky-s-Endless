if(room = rmDeath) {
	showTimer++;
	//draw_set_font(fontPixelMenu);
	FontSet("big");
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if(showTimer >= 120) {
		if(timeNow < time) {
			if(!audio_is_playing(sndCount)) {
				timeNow += 10;
				audio_play_sound(sndCount, 10, false);
				showTimer = 120;
			}
		} else {
			timeNow = time;	
			showTimer++;
		}
		draw_text(room_width/2, 40, JsonGetValue("you_lived") +  string(timeNow) + JsonGetValue("turns"));
	}
	if(showTimer >= 240) {
		if(!showDayToggle) {
			showDayToggle = true;
			alarm[0] = 60;
		}
		if(day <= 1) {
			draw_text(room_width/2, 80, JsonGetValue("you_lived") + string(floor(day)) + JsonGetValue("day"));
		}
		if(day >= 2) {
			if(dayNow < day) {
				if(!audio_is_playing(sndCount)) {
					dayNow += 1;
					audio_play_sound(sndCount, 10, false);
					showTimer = 240;
				}
			} else {
				dayNow = day;	
				showTimer++;
			}
			draw_text(room_width/2, 80, JsonGetValue("you_lived") + string(floor(day)) + JsonGetValue("days"));
		}
	}
	if(showTimer >= 360) {
		if(monsterKilledNow[0] < monsterKilled[0]) {
			if(!audio_is_playing(sndCount)) {
				audio_play_sound(sndCount, 10, false);
				monsterKilledNow[0]++;
				showTimer = 360;
			}
		} else {
			monsterKilledNow[0] = monsterKilled[0];
			showTimer++;
		}
		draw_text(room_width/2, 120, JsonGetValue("you_killed") + string(monsterKilledNow[0]));
		draw_sprite_ext(sMonster, -1, room_width/2 + string_length(JsonGetValue("you_killed") + string(monsterKilledNow[0])) + 70, 120, 4, 4, 0, c_white, 1);
	}
	if(showTimer >= 480) {
		if(monsterKilledNow[1] < monsterKilled[1]) {
			if(!audio_is_playing(sndCount)) {
				showTimer = 480;
				monsterKilledNow[1]++;
				audio_play_sound(sndCount, 10, false);
			}
		} else {
			monsterKilledNow[1] = monsterKilled[1];
			showTimer++;
		}
		draw_text(room_width/2, 160, JsonGetValue("you_killed") + string(monsterKilledNow[1]));
		draw_sprite_ext(sMonster2, -1, room_width/2 + string_length(JsonGetValue("you_killed") + string(monsterKilledNow[1])) + 70, 160, 4, 4, 0, c_white, 1);
	}
	if(showTimer >= 600) {
		if(monsterKilledNow[2] < monsterKilled[2]) {
			if(!audio_is_playing(sndCount)) {
				monsterKilledNow[2]++;
				audio_play_sound(sndCount, 10, false);
			}		
		} else {
			monsterKilledNow[2] = monsterKilled[2];	
			if(!overToggle) {
				overToggle = true;
				alarm[1] = 120;
			}
		}
		draw_text(room_width/2, 200, JsonGetValue("you_killed") + string(monsterKilledNow[2]));
		draw_sprite_ext(sMonster3, -1, room_width/2 + string_length(JsonGetValue("you_killed") + string(monsterKilledNow[2])) + 70, 200, 4, 4, 0, c_white, 1);
	}
}