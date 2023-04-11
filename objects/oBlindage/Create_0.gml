image_speed = 0;
image_index = irandom(1);
image_xscale = 0;
image_yscale = 0;

//doubled = false;
//explode = false;

deadTimer = 0;

audio_play_sound(sndUse, 10, false);

gridX = x div 8;
gridY = y div 8;
corner = false;
hp = 8 + doubled*8;
maxhp = hp;
preHP = hp;