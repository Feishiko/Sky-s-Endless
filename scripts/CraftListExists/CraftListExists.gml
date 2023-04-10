// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CraftListExists(_itemID){
	var passed = false;
	for(var sequence = 0; sequence < 7; sequence++) {
		if(oGameCont.craftList[sequence] == _itemID) {
			passed = true;
		}
	}
	return passed;
}