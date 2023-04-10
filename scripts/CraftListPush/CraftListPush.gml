// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CraftListPush(_itemID){
	for(var sequence = 0; sequence < 7; sequence++) {
		if(craftList[sequence] == -1) {
			craftList[sequence] = _itemID;
			break;
		}
	}	
}