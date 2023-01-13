// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemGetName(itemID, _sequence){
	// -1 - Nop 0 - WheatSeed 1 - Wheat 2 - IronSeed 3 - Iron 4 - PowderSeed 5 - Powder
	switch(itemID) {
		case -1: return "-";break;
		case 0: draw_set_color(c_green);return "Wheat Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 1: draw_set_color(c_black);return "Wheat" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 2: draw_set_color(c_green);return "Iron Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 3: draw_set_color(c_black);return "Iron" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 4: draw_set_color(c_green);return "Powder Seed" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 5: draw_set_color(c_black);return "Powder" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 6: draw_set_color(c_maroon);return "Pistol";break;
		case 7: draw_set_color(c_maroon);return "Bullet" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 8: draw_set_color(c_orange);return "Blindage" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 9: draw_set_color(c_navy);return "Bread" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 10: draw_set_color(c_orange);return "Plough" + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 11: draw_set_color(c_maroon);return "Grenade" + "x" + string(oPlayer.items[_sequence, 1]);break;
	}
}