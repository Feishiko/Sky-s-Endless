// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemDelete(_itemID, _number){
	var number = _number;
	for(var sequence = 0; sequence < 10; sequence++) {
		if(oPlayer.items[sequence, 0] == _itemID) {
			if(oPlayer.items[sequence, 1] >= number) {
				oPlayer.items[sequence, 1] = max(0, oPlayer.items[sequence, 1] - number);	
				return sequence;
				break;
			} else {
				number -= oPlayer.items[sequence, 1];
				oPlayer.items[sequence, 1] = 0;	
			}
		}
	}
}