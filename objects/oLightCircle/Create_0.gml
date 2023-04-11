r = 0;

vanish = false;

audio_play_sound(sndGrenade, 50, false);

instance_create_depth(x - 8, y, -20, oBoom);
instance_create_depth(x + 8, y, -20, oBoom);
instance_create_depth(x, y - 8, -20, oBoom);
instance_create_depth(x, y + 8, -20, oBoom);
instance_create_depth(x - 8, y - 8, -20, oBoom);
instance_create_depth(x + 8, y - 8, -20, oBoom);
instance_create_depth(x - 8, y + 8, -20, oBoom);
instance_create_depth(x + 8, y + 8, -20, oBoom);