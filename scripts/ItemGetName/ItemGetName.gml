// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemGetName(itemID, _sequence){
	// -1 - Nop 0 - WheatSeed 1 - Wheat 2 - IronSeed 3 - Iron 4 - PowderSeed 5 - Powder
	switch(itemID) {
		case -1: return "-";break;
		case 0: draw_set_color(c_green);return JsonGetValue("item_0") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 1: draw_set_color(c_black);return JsonGetValue("item_1") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 2: draw_set_color(c_green);return JsonGetValue("item_2") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 3: draw_set_color(c_black);return JsonGetValue("item_3") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 4: draw_set_color(c_green);return JsonGetValue("item_4") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 5: draw_set_color(c_black);return JsonGetValue("item_5") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 6: draw_set_color(c_maroon);return JsonGetValue("item_6");break;
		case 7: draw_set_color(c_maroon);return JsonGetValue("item_7") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 8: draw_set_color(c_orange);return JsonGetValue("item_8") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 9: draw_set_color(c_navy);return JsonGetValue("item_9") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 10: draw_set_color(c_orange);return JsonGetValue("item_10") + "x" + string(oPlayer.items[_sequence, 1]);break;
		case 11: draw_set_color(c_maroon);return JsonGetValue("item_11") + "x" + string(oPlayer.items[_sequence, 1]);break;
	}
}