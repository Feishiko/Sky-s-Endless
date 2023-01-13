// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemPick(_itemID, _number) {
	var finish = false;
	//If not pistol
	if(_itemID != 6) {
		for(var sequence = 0; sequence < 10; sequence++) {
			if(oPlayer.items[sequence, 0] == _itemID && !finish) {
				oPlayer.items[sequence, 1] += _number;	
				finish = true;
			}
		}
		if(!finish) {
			for(var sequence = 0; sequence < 10; sequence++) {
				if(oPlayer.items[sequence, 0] == -1 && !finish) {
					oPlayer.items[sequence, 0] = _itemID;
					oPlayer.items[sequence, 1] = _number;
					finish = true;
				}
			}
		}
	}else {
		//If pistol
		for(var sequence = 0; sequence < 10; sequence++) {
			if(oPlayer.items[sequence, 0] == -1 && !finish) {
				oPlayer.items[sequence, 0] = _itemID;
				oPlayer.items[sequence, 1] = _number;
				finish = true;
			}
		}	
	}
	//If not finish
	if(!finish) {
		var ins = instance_create_depth(oPlayer.x, oPlayer.y, -10, oItem);	
		ins.itemID = _itemID;
		ins.number = _number;
	}
}