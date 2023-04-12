// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemUse(_sequence) {
	//Harvest Type
	if(oPlayer.items[_sequence, 0] == 0 || oPlayer.items[_sequence, 0] == 2 || oPlayer.items[_sequence, 0] == 4) {
		var harvests = collision_point(x, y, oTile, 1, 1);
		if(harvests.tiles == 1 && !collision_point(x, y, oBlindage, 1, 1)) {
			if(oPlayer.items[_sequence, 1] >= 1) {
				harvests.doubled = oPlayer.items[_sequence, 2];
				harvests.explode = oPlayer.items[_sequence, 3];
				harvests.faster = oPlayer.items[_sequence, 4];
				
				// Tutorial
				if(instance_exists(oTutorial)) {
					oTutorial.tutoTiles += 1;	
				}
				
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
				var item = ItemDelete(7, 1);
				Light(2);
				with(oBorder) {
					weaponType = 0;//Pistol	
				}
				
				if(oPlayer.items[item, 4]) {
					with(oBorder) {
						doubledBullet = true;	
					}
				} else {
					with(oBorder) {
						doubledBullet = false;	
					}	
				}
				
				if(oPlayer.items[item, 3]) {
					with(oBorder) {
						explode = true;	
					}
				} else {
					with(oBorder) {
						explode = false;	
					}	
				}
				
				audio_play_sound(sndShoot, 20, false);
				if(oPlayer.items[_sequence, 2]) {
					oBorder.doubledPistol = true;	
				}
				if(oPlayer.items[_sequence, 3]) {
					instance_create_depth(oPlayer.x, oPlayer.y, -20, oLightCircle);	
				}
				innerShootTurn += 1;
				if(oPlayer.innerShootTurn >= 1 + oPlayer.items[_sequence, 4]) {
					TimePassed();
					oPlayer.innerShootTurn = 0;	
				}
			}
		}
	}
	//Grenade
	if(oPlayer.items[_sequence, 0] == 11) {
		if(instance_exists(oBorder)) {
			if(ItemExists(11, 1)) {
				var item = ItemDelete(11, 1);
				Light(10);
				with(oBorder) {
					weaponType = 1;//Grenade	
				}
				if(oPlayer.items[_sequence, 2]) {
					with(oBorder) {
						doubledGrenade = true;	
					}
				}
				audio_play_sound(sndGrenade, 30, false);
				if(oPlayer.items[_sequence, 3]) {
					with(oBorder) {
						explode = true;	
					}
				}
				oPlayer.innerGrenadeTurn += 1;
				if(oPlayer.innerGrenadeTurn >= 1 + oPlayer.items[_sequence, 4]) {
					TimePassed();
					oPlayer.innerGrenadeTurn = 0;	
				}
			}
		}
	}
	//Building Type
	//Plough
	if(oPlayer.items[_sequence, 0] == 10) {
		/*
		var lenX = lengthdir_x(8, image_angle);
		var lenY = lengthdir_y(8, image_angle);
		var space = collision_point(x + lenX, y + lenY, oTile, 1, 1);
		if(space.tiles = -1) {
			TimePassed();
			audio_play_sound(sndUse, 10, false);
			oPlayer.items[_sequence, 1] -= 1;
			oGameCont.tiles[space.row, space.column] = 1;
		}
		*/
		for(var face = 0; face < 4; face++) {
			var lenX = lengthdir_x(8, image_angle + (90 * face));
			var lenY = lengthdir_y(8, image_angle + (90 * face));
			var space = collision_point(x + lenX, y + lenY, oTile, 1, 1);	
			//var blindage = collision_point(x + lenX, y + lenY, oTile, 1, 1);
			if(space.tiles == -1) {
				//TimePassed();
				oPlayer.buildingMode = true;
				oPlayer.buildingBuff[0] = oPlayer.items[_sequence, 2];
				oPlayer.buildingBuff[1] = oPlayer.items[_sequence, 3];
				oPlayer.buildingBuff[2] = oPlayer.items[_sequence, 4];
				instance_create_depth(x + lenX, y + lenY, -20, oBorder);
			}	
		}
		
		if(oPlayer.buildingMode) {
			oPlayer.buildingStuff = oTile;
			oPlayer.items[_sequence, 1] -= 1;
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
			oPlayer.buildingStuff = oBlindage;
			oPlayer.buildingBuff[0] = oPlayer.items[_sequence, 2];
			oPlayer.buildingBuff[1] = oPlayer.items[_sequence, 3];
			oPlayer.buildingBuff[2] = oPlayer.items[_sequence, 4];
			oPlayer.items[_sequence, 1] -= 1;
		}
	}
	
	//Others Type
	//Bread
	if(oPlayer.items[_sequence, 0] == 9) {
		if(oPlayer.hp < oPlayer.hpMax) {
			//If faster then don't pass the turn
			if(!oPlayer.items[_sequence, 4]) {
				TimePassed();
			}
			audio_play_sound(sndUse, 10, false);
			oPlayer.items[_sequence, 1] -= 1;
			//If doubled then double hp regain
			oPlayer.hp += 1 + oPlayer.items[_sequence, 2];	
			//Explode
			if(oPlayer.items[_sequence, 3]) {
				instance_create_depth(x, y, -20, oLightCircle);
			}
		}
	}
	
	if(oPlayer.items[_sequence, 0] == 12) {
		oPlayer.hp *= 2;
		oPlayer.hpMax *= 2;
		oPlayer.items[_sequence, 1] -= 1;
		repeat(20) {
			instance_create_depth(x, y, -20, oPotionPartical);	
		}
		PotionWord(JsonGetValue("potion_word_1"));
	}
	
	if(oPlayer.items[_sequence, 0] == 13) {
		audio_play_sound(sndGrenade, 100, false);
		PotionWord(JsonGetValue("potion_word_2"));
		Light(15);
		repeat(20) {
			instance_create_depth(x, y, -20, oPotionPartical);	
		}
		with(oMonster) {
			Brick(x, y);
			hp -= 4;	
		}
		oPlayer.items[_sequence, 1] -= 1;
	}
	
	if(oPlayer.items[_sequence, 0] == 14) {
		PotionWord(JsonGetValue("potion_word_3"));
		repeat(20) {
			instance_create_depth(x, y, -20, oPotionPartical);	
		}
		oPlayer.spd += 1;
		oPlayer.items[_sequence, 1] -= 1;
	}
}