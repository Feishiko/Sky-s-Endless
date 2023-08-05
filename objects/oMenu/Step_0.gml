var ENTER = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);
var UP = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || mouse_wheel_up();
var DOWN = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || mouse_wheel_down();

// Reset

if(keyboard_check_pressed(ord("R"))) {
	if(file_exists("highScore")) {
		file_delete("highScore");	
	}
	if(file_exists("tutorial")) {
		file_delete("tutorial");	
	}
	if(file_exists("guidence")) {
		file_delete("guidence");
	}
	game_restart();
}

// MUSIC
MusicPlay(musMenu);
if(!instance_exists(oIntoGame)) {
	if(UP && pointer > 0) {
		pointer -= 1;	
		audio_play_sound(sndSelectItems, 10, false);
	}

	if(DOWN && pointer < 3) {
		pointer += 1;
		audio_play_sound(sndSelectItems, 10, false);
	}
	if(ENTER) {
		audio_play_sound(sndButton, 1000, false);
		switch(pointer) {
			case 0: instance_create_depth(0, 0, -200, oIntoGame);break;
			case 1: {
				if(!instance_exists(oHelp)) {
					instance_create_depth(0, 0, -100, oHelp);	
				}else{
					instance_destroy(oHelp);	
				}break;
			}
			case 2: {
				global.language = !global.language;
				var file = -1;
				global.text = "";
				switch(global.language) {
					case 0: file = file_text_open_read(working_directory  + "Languages/english.json");break;	
					case 1: file = file_text_open_read(working_directory  + "Languages/chinese.json");break;	
				}
				while (!file_text_eof(file)){
					global.text += file_text_readln(file);
				}

				global.json = json_parse(global.text);

				file_text_close(file);	
			
				event_perform(ev_create, 0);
				pointer = 2;
				var language = file_text_open_write("language");
				file_text_write_real(language, global.language);
				file_text_close(language);
			}break;
			case 3: game_end();break;
		}
	}
}