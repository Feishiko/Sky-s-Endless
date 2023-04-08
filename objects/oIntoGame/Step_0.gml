alpha += 0.005;

if(alpha >= 1.5) {
	room_goto(rmGame);	
}

gain = lerp(gain, 0, .02);
audio_emitter_gain(global.Emitter, gain);