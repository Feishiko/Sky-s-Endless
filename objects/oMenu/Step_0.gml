var ENTER = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left);
var UP = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || mouse_wheel_up();
var DOWN = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || mouse_wheel_down();

if(UP && pointer > 0) {
	pointer -= 1;	
	audio_play_sound(sndSelectItems, 10, false);
}

if(DOWN && pointer < 2) {
	pointer += 1;
	audio_play_sound(sndSelectItems, 10, false);
}
if(ENTER) {
	switch(pointer) {
		case 0: room_goto(rmGame);break;
		case 1: {
			if(!instance_exists(oHelp)) {
				instance_create_depth(0, 0, -100, oHelp);	
			}else{
				instance_destroy(oHelp);	
			}break;
		}
		case 2: game_end();break;
	}
}