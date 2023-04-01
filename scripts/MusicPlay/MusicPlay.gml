// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MusicPlay(_music) {
	var gain = audio_emitter_get_gain(global.Emitter);
	if(!audio_is_playing(_music)) {
		gain = lerp(gain, 0, .1);
		audio_emitter_gain(global.Emitter, gain);	
	}
	if(!audio_is_playing(_music) && gain == 0) {
		audio_stop_all();
		audio_play_sound_on(global.Emitter, _music, 200, true);
	}
	if(audio_is_playing(_music)) {
		gain = lerp(gain, 1, .1);
		audio_emitter_gain(global.Emitter, gain);
	}
}