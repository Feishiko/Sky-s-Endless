// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemToss(_sequence){
	if(oPlayer.items[_sequence, 0] != -1) {
		TimePassed();
		var ins = instance_create_depth(x, y, -10, oItem);
		ins.itemID = oPlayer.items[_sequence, 0];
		ins.number = oPlayer.items[_sequence, 1];
	
		oPlayer.items[_sequence, 0] = -1;
		oPlayer.items[_sequence, 1] = 0;
	}
}