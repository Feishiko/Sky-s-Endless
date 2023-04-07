image_speed = 0;
image_index = irandom(1);
image_xscale = 0;
image_yscale = 0;

deadTimer = 0;

audio_play_sound(sndUse, 10, false);

gridX = x div 8;
gridY = y div 8;
corner = false;
hp = 8;
preHP = hp;