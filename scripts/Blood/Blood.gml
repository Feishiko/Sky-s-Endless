// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Blood(_x, _y){
	repeat(50) {
		instance_create_depth(_x, _y, -5, oBlood);
	}
	audio_play_sound(sndHurt, 60, false);
}