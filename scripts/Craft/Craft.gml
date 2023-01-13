// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Craft(_itemID, _number){
	switch(_itemID) {
		case 6: ItemDelete(3, 4);break;
		case 7: ItemDelete(3, 1);ItemDelete(5, 1);break;
		case 8: ItemDelete(3, 8);break;
		case 9: ItemDelete(1, 4);break;
		case 10: ItemDelete(0, 2);ItemDelete(2, 2);ItemDelete(4, 2);ItemDelete(1, 4);break;
		case 11: ItemDelete(3, 1);ItemDelete(5, 4);break;
	}
	audio_play_sound(sndMake, 40, false);
	ItemPick(_itemID, _number);
}