// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemExists(_itemID, _number){
	var passed = false;
	for(var sequence = 0; sequence < 10; sequence++) {
		if(oPlayer.items[sequence, 0] == _itemID) {
			if(oPlayer.items[sequence, 1] >= _number){
				passed = true;	
			}
		}
	}
	return passed;
}