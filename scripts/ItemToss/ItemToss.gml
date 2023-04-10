// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemToss(_sequence){
	if(oPlayer.items[_sequence, 0] >= 12 && oPlayer.items[_sequence, 0] <= 14) {
		TimePassed();
		var ins = instance_create_depth(x, y, -10, oPotionSplit);
		ins.doubled = oPlayer.items[_sequence, 2];
		ins.explode = oPlayer.items[_sequence, 3];
		ins.faster = oPlayer.items[_sequence, 4];
		oPlayer.items[_sequence, 1] -= 1;
		audio_play_sound(sndGlass, 200, false);
	} else {
		if(oPlayer.items[_sequence, 0] != -1) {
			TimePassed();
			var ins = instance_create_depth(x, y, -10, oItem);
			ins.itemID = oPlayer.items[_sequence, 0];
			ins.number = oPlayer.items[_sequence, 1];
			ins.doubled = oPlayer.items[_sequence, 2];
			ins.explode = oPlayer.items[_sequence, 3];
			ins.faster = oPlayer.items[_sequence, 4];
	
			oPlayer.items[_sequence, 0] = -1;
			oPlayer.items[_sequence, 1] = 0;
			oPlayer.items[_sequence, 2] = false;
			oPlayer.items[_sequence, 3] = false;
			oPlayer.items[_sequence, 4] = false;
		}
	}
}