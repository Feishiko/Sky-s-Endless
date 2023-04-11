// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Craft(_itemID, _number){
	var item, item1, item2, item3, faster, explode;
	switch(_itemID) {
		case 6: {
			item = ItemDelete(3, 4);
			if(oPlayer.items[item, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 7: {
			item = ItemDelete(3, 1);
			item1 = ItemDelete(5, 1);
			if(oPlayer.items[item, 4] && oPlayer.items[item1, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3] || oPlayer.items[item1, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 8: {
			item = ItemDelete(3, 8);
			if(oPlayer.items[item, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 9: {
			item = ItemDelete(1, 4);
			if(oPlayer.items[item, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 10: {
			item = ItemDelete(0, 2);
			item1 = ItemDelete(2, 2);
			item2 = ItemDelete(4, 2);
			item3 = ItemDelete(1, 4);
			if(oPlayer.items[item, 4] && oPlayer.items[item1, 4] && oPlayer.items[item2, 4] && oPlayer.items[item3, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3] || oPlayer.items[item1, 3] || oPlayer.items[item2, 3] || oPlayer.items[item3, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 11: {
			item = ItemDelete(3, 1);
			item1 = ItemDelete(5, 4);
			if(oPlayer.items[item, 4] && oPlayer.items[item1, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3] || oPlayer.items[item1, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
		case 12: {
			item = ItemDelete(0, 100);
			item1 = ItemDelete(2, 100);
			item2 = ItemDelete(4, 100);
			item3 = ItemDelete(1, 100);
			if(oPlayer.items[item, 4] && oPlayer.items[item1, 4] && oPlayer.items[item2, 4] && oPlayer.items[item3, 4]) {
				faster = true;	
			} else {
				faster = false;	
			}
			
			if(oPlayer.items[item, 3] || oPlayer.items[item1, 3] || oPlayer.items[item2, 3] || oPlayer.items[item3, 3]) {
				explode = true;	
			} else {
				explode = false;	
			}
		};break;
	}
	if(!faster) {
		TimePassed();	
	}
	
	if(explode) {
		instance_create_depth(oPlayer.x, oPlayer.y, -20, oLightCircle);	
	}
	
	audio_play_sound(sndMake, 40, false);
	if(_itemID != 12){
		ItemPick(_itemID, _number);
	} else {
		var rand = irandom(2);
		ItemPick(_itemID + rand, _number, rand == 0, rand == 1, rand == 2);	
	}
}