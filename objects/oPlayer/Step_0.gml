if(hp > 0) {
	var LEFT = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	var RIGHT = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	var UP = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var DOWN = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	var HELP = keyboard_check_pressed(vk_tab);
	var PASS = keyboard_check_pressed(190) || mouse_check_button_pressed(mb_right);
	var USE = keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left);
	var PICK = keyboard_check_pressed(vk_space);
	var TOSS = keyboard_check_pressed(ord("Q"));
	var MOVE = keyboard_check(vk_shift);

	if(LEFT && oGameCont.tiles[gridX - 1, gridY] != -1 && !MOVE && !oGameCont.craftMode && !buildingMode) {
		gridX -= 1;	
		audio_play_sound(sndWalk, 5, false);
	}

	if(RIGHT && oGameCont.tiles[gridX + 1, gridY] != -1 && !MOVE && !oGameCont.craftMode && !buildingMode) {
		gridX += 1;	
		audio_play_sound(sndWalk, 5, false);
	}

	if(UP && oGameCont.tiles[gridX, gridY - 1] != -1 && !MOVE && !oGameCont.craftMode && !buildingMode) {
		gridY -= 1;	
		audio_play_sound(sndWalk, 5, false);
	}

	if(DOWN && oGameCont.tiles[gridX, gridY + 1] != -1 && !MOVE && !oGameCont.craftMode && !buildingMode) {
		gridY += 1;	
		audio_play_sound(sndWalk, 5, false);
	}

	x = lerp(x, gridX*8 + 4, .2);
	y = lerp(y, gridY*8 + 4, .2);

	if(USE && !oGameCont.craftMode && !buildingMode) {
		ItemUse(oGameCont.select);	
	}

	if(TOSS && !buildingMode) {
		ItemToss(oGameCont.select);		
	}

	if(PICK && !buildingMode) {
		var picks = collision_point(x, y, oItem, 1, 1);
		if(picks) {
			TimePassed();
			ItemPick(picks.itemID, picks.number, picks.doubled, picks.explode, picks.faster);
			instance_destroy(picks);
		}
		var harvests = collision_point(x, y, oTile, 1, 1);
		if(harvests.tiles = 3 || harvests.tiles = 5 || harvests.tiles = 7) {
			audio_play_sound(sndPick, 10, false);
			TimePassed();
			ItemPick(harvests.tiles - 2, 1 + harvests.doubled + harvests.foreverDoubled);
			ItemPick(harvests.tiles - 3, 2 + harvests.doubled*2 + harvests.foreverDoubled*2);
			if(harvests.explode) {
				instance_create_depth(x, y, -20, oLightCircle);
			}
			if(harvests.foreverExplode) {
				instance_create_depth(x, y, -20, oLightCircle);
			}
			harvests.tiles = 1;
			harvests.doubled = false;
			harvests.explode = false;
			harvests.faster = false;
			oGameCont.tiles[harvests.row, harvests.column] = 1;
		}
	}

	if(HELP) {
		if(!instance_exists(oHelp)) {
			instance_create_depth(0, 0, -100, oHelp);	
		}else {
			instance_destroy(oHelp);	
		}
	}

	if(LEFT || RIGHT || UP || DOWN) {
		if(!MOVE && !oGameCont.craftMode && !buildingMode) {
			sprite_index = sPlayerWalk;	
		}
	}

	if(sprite_index == sPlayerWalk) {
		walkDuration++;
		if(walkDuration >= 10) {
			walkDuration = 0;
			sprite_index = sPlayerIdle;
		}
	}

	if(LEFT || RIGHT) {
		if(!MOVE && !oGameCont.craftMode && LEFT && !buildingMode) {
			image_angle = 180;	
		}
		if(!MOVE && !oGameCont.craftMode && RIGHT && !buildingMode) {
			image_angle = 0;	
		}
	}

	if(UP || DOWN) {
		if(!MOVE && !oGameCont.craftMode && UP && !buildingMode) {
			image_angle = 90;	
		}
		if(!MOVE && !oGameCont.craftMode && DOWN && !buildingMode) {
			image_angle = 270;	
		}
	}

	if(PASS || LEFT || RIGHT || UP || DOWN) {
		if(!MOVE && !oGameCont.craftMode && !buildingMode) {
			TimePassed();
		}
	}
	//Shooting Mode
	if(oPlayer.items[oGameCont.select, 0] == 6) {
		sprite_index = sPlayerShoot;	
		image_angle = point_direction(x, y, mouse_x, mouse_y);
	}else {
		if(sprite_index = sPlayerShoot) {
			sprite_index = sPlayerIdle;	
			image_angle = 0;
		}
	}
	//Building Mode
	if(buildingMode) {
		if(LEFT) {
			var border = collision_point(x - 8, y, oBorder, 1, 1);
			if(border) {
				if(buildingStuff == oBlindage) {
					var stuff = instance_create_depth(x - 8, y, -20, buildingStuff, {
						doubled : oPlayer.buildingBuff[0],
						explode : oPlayer.buildingBuff[1]
					});
					stuff.image_angle = 180;
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				if(buildingStuff == oTile) {
					audio_play_sound(sndUse, 10, false);
					var space = collision_point(x - 8, y, oTile, 1, 1);
					space.foreverDoubled = buildingBuff[0];
					space.foreverExplode = buildingBuff[1];
					space.foreverFaster = buildingBuff[2];
					oGameCont.tiles[space.row, space.column] = 1;	
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				instance_destroy(oBorder);	
				buildingMode = false;
			}
		}
		if(RIGHT) {
			var border = collision_point(x + 8, y, oBorder, 1, 1);
			if(border) {
				if(buildingStuff == oBlindage) {
					var stuff = instance_create_depth(x + 8, y, -20, buildingStuff, {
						doubled : oPlayer.buildingBuff[0],
						explode : oPlayer.buildingBuff[1]
					});
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				if(buildingStuff == oTile) {
					audio_play_sound(sndUse, 10, false);
					var space = collision_point(x + 8, y, oTile, 1, 1);
					space.foreverDoubled = buildingBuff[0];
					space.foreverExplode = buildingBuff[1];
					space.foreverFaster = buildingBuff[2];
					oGameCont.tiles[space.row, space.column] = 1;	
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				instance_destroy(oBorder);	
				buildingMode = false;
			}
		}
		if(UP) {
			var border = collision_point(x, y - 8, oBorder, 1, 1);
			if(border) {
				if(buildingStuff == oBlindage) {
					var stuff = instance_create_depth(x, y - 8, -20, buildingStuff, {
						doubled : oPlayer.buildingBuff[0],
						explode : oPlayer.buildingBuff[1]
					});
					stuff.image_angle = 90;
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				if(buildingStuff == oTile) {
					audio_play_sound(sndUse, 10, false);
					var space = collision_point(x, y - 8, oTile, 1, 1);
					space.foreverDoubled = buildingBuff[0];
					space.foreverExplode = buildingBuff[1];
					space.foreverFaster = buildingBuff[2];
					oGameCont.tiles[space.row, space.column] = 1;	
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				instance_destroy(oBorder);
				buildingMode = false;
			}
		}
		if(DOWN) {
			var border = collision_point(x, y + 8, oBorder, 1, 1);
			if(border) {
				if(buildingStuff == oBlindage) {
					var stuff = instance_create_depth(x, y + 8, -20, buildingStuff, {
						doubled : oPlayer.buildingBuff[0],
						explode : oPlayer.buildingBuff[1]
					});
					stuff.image_angle = 270;
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				if(buildingStuff == oTile) {
					audio_play_sound(sndUse, 10, false);
					var space = collision_point(x, y + 8, oTile, 1, 1);
					space.foreverDoubled = buildingBuff[0];
					space.foreverExplode = buildingBuff[1];
					space.foreverFaster = buildingBuff[2];
					oGameCont.tiles[space.row, space.column] = 1;	
					if(!buildingBuff[2]) {
						TimePassed();
					}
				}
				instance_destroy(oBorder);	
				buildingMode = false;
			}
		}
	}

	//IS ITEM EMPTY

	for(var itemsNumber = 0; itemsNumber < 10; itemsNumber++) {
		if(items[itemsNumber, 1] <= 0 && items[itemsNumber, 0] != -1) {
			items[itemsNumber, 0] = -1;	
			items[itemsNumber, 2] = false;	
			items[itemsNumber, 3] = false;	
			items[itemsNumber, 4] = false;	
		}
	}
} else {
	sprite_index = sPlayerDead;
	deathTimer++;
	audio_emitter_gain(global.Emitter, 0);
	if(deathTimer >= 180) {
		oDeath.day = oGameCont.day;
		oDeath.time = oGameCont.time;
		oDeath.monsterKilled[0] = oGameCont.monsterKilled[0];//FirstType
		oDeath.monsterKilled[1] = oGameCont.monsterKilled[1];//SecondType
		oDeath.monsterKilled[2] = oGameCont.monsterKilled[2];//ThirdType
		room_goto(rmDeath);	
	}
	if(instance_exists(oHelp)){
		instance_destroy(oHelp);
	}
	with(oCamera) {
		viewWidth = 12;
		viewHeight = 12;
	}
}