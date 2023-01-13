// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemUse(_sequence) {
	//Harvest Type
	if(oPlayer.items[_sequence, 0] == 0 || oPlayer.items[_sequence, 0] == 2 || oPlayer.items[_sequence, 0] == 4) {
		var harvests = collision_point(x, y, oTile, 1, 1);
		if(harvests.tiles == 1 && !collision_point(x, y, oBlindage, 1, 1)) {
			if(oPlayer.items[_sequence, 1] >= 1) {
				TimePassed();
				audio_play_sound(sndUse, 10, false);
				oPlayer.items[_sequence, 1] -= 1;	
				switch(oPlayer.items[_sequence, 0]) {
					case 0: oGameCont.tiles[oPlayer.gridX, oPlayer.gridY] = 2;break;
					case 2: oGameCont.tiles[oPlayer.gridX, oPlayer.gridY] = 4;break;	
					case 4: oGameCont.tiles[oPlayer.gridX, oPlayer.gridY] = 6;break;	
				}
			}
		}
	}
	//Weapon Type
	//Pistol
	if(oPlayer.items[_sequence, 0] == 6) {
		if(instance_exists(oBorder)) {
			if(ItemExists(7, 1)) {
				ItemDelete(7, 1);
				Light(2);
				with(oBorder) {
					weaponType = 0;//Pistol	
				}
				audio_play_sound(sndShoot, 20, false);
				TimePassed();
			}
		}
	}
	//Grenade
	if(oPlayer.items[_sequence, 0] == 11) {
		if(instance_exists(oBorder)) {
			if(ItemExists(11, 1)) {
				ItemDelete(11, 1);
				Light(10);
				with(oBorder) {
					weaponType = 1;//Grenade	
				}
				audio_play_sound(sndGrenade, 30, false);
				TimePassed();
			}
		}
	}
	//Building Type
	//Plough
	if(oPlayer.items[_sequence, 0] == 10) {
		var lenX = lengthdir_x(8, image_angle);
		var lenY = lengthdir_y(8, image_angle);
		var space = collision_point(x + lenX, y + lenY, oTile, 1, 1);
		if(space.tiles = -1) {
			TimePassed();
			audio_play_sound(sndUse, 10, false);
			oPlayer.items[_sequence, 1] -= 1;
			oGameCont.tiles[space.row, space.column] = 1;
		}
	}
	//Blindage
	if(oPlayer.items[_sequence, 0] == 8) {
		for(var face = 0; face < 4; face++) {
			var lenX = lengthdir_x(8, image_angle + (90 * face));
			var lenY = lengthdir_y(8, image_angle + (90 * face));
			var space = collision_point(x + lenX, y + lenY, oTile, 1, 1);	
			var blindage = collision_point(x + lenX, y + lenY, oBlindage, 1, 1);
			if(space.tiles == 1 && !blindage) {
				//TimePassed();
				oPlayer.buildingMode = true;
				instance_create_depth(x + lenX, y + lenY, -20, oBorder);
			}	
		}
		
		if(oPlayer.buildingMode) {
			oPlayer.items[_sequence, 1] -= 1;
		}
	}
	
	//Others Type
	//Bread
	if(oPlayer.items[_sequence, 0] == 9) {
		if(oPlayer.hp < oPlayer.hpMax) {
			//TimePassed();
			audio_play_sound(sndUse, 10, false);
			oPlayer.items[_sequence, 1] -= 1;
			oPlayer.hp += 1;	
		}
	}
}