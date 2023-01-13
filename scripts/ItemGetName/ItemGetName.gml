// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemGetName(itemID, _sequence){
	// -1 - Nop 0 - WheatSeed 1 - Wheat 2 - IronSeed 3 - Iron 4 - PowderSeed 5 - Powder
	switch(itemID) {
		case -1: return "-";break;
		case 0: return "Wheat Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 1: return "Wheat" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 2: return "Iron Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 3: return "Iron" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 4: return "Powder Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 5: return "Powder" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 6: return "Pistol";break;
		case 7: return "Bullet" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 8: return "Blindage" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 9: return "Bread" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 10: return "Plough" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 11: return "Grenade" + "x" + string(oPlayer.items[_sequence, 1]);break;
	}
}