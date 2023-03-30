if(oPlayer.hp > 0) {
	var UP = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var DOWN = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	var CRAFT = keyboard_check_pressed(ord("C"));
	var USE = keyboard_check_pressed(ord("E")) || mouse_check_button_pressed(mb_left);
	
	//CHANGE SELECT
	if(!craftMode) {
		for(var keyNumber = 0; keyNumber < 9; keyNumber++) {
			if(keyboard_check_pressed(ord(string(keyNumber + 1)))) {
				audio_play_sound(sndSelectItems, 0, false);
				select = keyNumber;	
			}
		}

		if(keyboard_check_pressed(ord(string(0)))) {
			audio_play_sound(sndSelectItems, 0, false);
			select = 9;	
		}

		if(mouse_wheel_up() && select >= 1) {
				audio_play_sound(sndSelectItems, 0, false);
				select -= 1;	
			}
	
		if(mouse_wheel_down() && select < 9) {
			audio_play_sound(sndSelectItems, 0, false);
			select += 1;	
		}

		if(keyboard_check_pressed(vk_shift)) {
			shift[0] = oPlayer.items[select, 0];//ItemID
			shift[1] = oPlayer.items[select, 1];//ItemNumber
			shift[2] = select;//ItemPosition
		}

		if(keyboard_check(vk_shift)) {
			if(UP && select >= 1) {
				audio_play_sound(sndSelectItems, 0, false);
				select -= 1;	
			}
	
			if(DOWN && select < 9) {
				audio_play_sound(sndSelectItems, 0, false);
				select += 1;	
			}
	
			if(shift[2] != select) {
				oPlayer.items[shift[2], 0] = oPlayer.items[select, 0];	
				oPlayer.items[shift[2], 1] = oPlayer.items[select, 1];	
				oPlayer.items[select, 0] = shift[0];
				oPlayer.items[select, 1] = shift[1];
				shift[0] = oPlayer.items[select, 0];//ItemID
				shift[1] = oPlayer.items[select, 1];//ItemNumber
				shift[2] = select;//ItemPosition
			}
		}
	}
	if(CRAFT) {
		craftMode = !craftMode;	
		if(craftMode) {
			//Init
			craftSelect = 0;
			for(var sequence = 0; sequence < 6; sequence++) {
				craftList[sequence] = -1;	
			}		
			//Pistol
			if(ItemExists(3, 4)) {
				CraftListPush(6);
			}
			//Bullet
			if(ItemExists(3, 1) && ItemExists(5, 1)) {
				CraftListPush(7);	
			}
			//Blindage
			if(ItemExists(3, 8)) {
				CraftListPush(8);	
			}
			//Bread
			if(ItemExists(1, 4)) {
				CraftListPush(9);	
			}
			//Plough
			if(ItemExists(0, 2) && ItemExists(2, 2) && ItemExists(4, 2) && ItemExists(1, 4)) {
				CraftListPush(10);	
			}
			//Grenade
			if(ItemExists(3, 1) && ItemExists(5, 2)) {
				CraftListPush(11);	
			}
		}
	}

	if(craftMode) {
		for(var sequence = 0; sequence < 6; sequence++) {
			if(craftList[sequence] == -1) {
				craftListMax = sequence;
				break;	
			}
		}
		if(UP || mouse_wheel_up()) {
			if(craftSelect > 0){
				audio_play_sound(sndSelectItems, 0, false);
				craftSelect -= 1;	
			}
		}
		if(DOWN || mouse_wheel_down()) {
			if(craftSelect < craftListMax - 1) {
				audio_play_sound(sndSelectItems, 0, false);
				craftSelect += 1;	
			}
		}
		if(USE) {
			switch(craftList[craftSelect]) {
				case 6: Craft(6, 1);break;
				case 7: Craft(7, 4);break;
				case 8: Craft(8, 1);break;
				case 9: Craft(9, 1);break;
				case 10: Craft(10, 1);break;
				case 11: Craft(11, 1);break;
			}
			TimePassed();
			craftMode = false;
		}
	}
	//Weapon System
	//Pistol
	if(oPlayer.items[oGameCont.select, 0] == 6) {
		var shootTargetMonster = collision_rectangle((mouse_x div 8)*8, (mouse_y div 8)*8, (mouse_x div 8)*8 + 7, (mouse_y div 8)*8 + 7, oMonster, 1, 0);
		var shootTargetBlindage = collision_rectangle((mouse_x div 8)*8, (mouse_y div 8)*8, (mouse_x div 8)*8 + 7, (mouse_y div 8)*8 + 7, oBlindage, 1, 0);
		if(shootTargetMonster || shootTargetBlindage) {
			if(shootTargetMonster) {
				if(!instance_exists(oBorder)) {
					instance_create_depth(shootTargetMonster.x, shootTargetMonster.y, -30, oBorder);
				}	
			}
			
			if(shootTargetBlindage) {
				if(!instance_exists(oBorder)) {
					instance_create_depth(shootTargetBlindage.x, shootTargetBlindage.y, -30, oBorder);
				}	
			}
			
		}else {
			with(oBorder){
				instance_destroy();	
			}
		}
	}
	//Grenade
	if(oPlayer.items[oGameCont.select, 0] == 11) {
		var shootTarget = collision_point(mouse_x, mouse_y, oMonster, 0, 1);
		if(shootTarget) {
			if(!instance_exists(oBorder)) {
				instance_create_depth(shootTarget.x, shootTarget.y, -30, oBorder);
				instance_create_depth(shootTarget.x - 8, shootTarget.y, -30, oBorder);
				instance_create_depth(shootTarget.x + 8, shootTarget.y, -30, oBorder);
				instance_create_depth(shootTarget.x, shootTarget.y - 8, -30, oBorder);
				instance_create_depth(shootTarget.x, shootTarget.y + 8, -30, oBorder);
				instance_create_depth(shootTarget.x - 8, shootTarget.y - 8, -30, oBorder);
				instance_create_depth(shootTarget.x - 8, shootTarget.y + 8, -30, oBorder);
				instance_create_depth(shootTarget.x + 8, shootTarget.y - 8, -30, oBorder);
				instance_create_depth(shootTarget.x + 8, shootTarget.y + 8, -30, oBorder);
				with(oBorder) {
					image_xscale = .5;
					image_yscale = .5;
				}
			}
		}else {
			instance_destroy(oBorder);	
		}
	}
	//Night
	if(day mod 1 != 0) {
		if(!audio_is_playing(musNight) && !audio_is_playing(musDay)) {
			audio_play_sound(musNight, 200, false);	
		}
		if(!instance_exists(oNight)) {
			instance_create_depth(0, 0, -40, oNight);	
		}
	}else {
		if(!audio_is_playing(musDay) && !audio_is_playing(musNight)) {
			audio_play_sound(musDay, 200, false);	
		}
		if(instance_exists(oNight)) {
			instance_destroy(oNight);		
		}
	}
	
	//MessageBox

	for(var row = 0; row < room_width div 8; row++) {
		for(var column = 0; column < room_height div 8; column++) {
			messageBox[row, column] = JsonGetValue("message_box_0");	
		}
	}

	with(oTile) {
		var persent = + "(" + string(growth) + "/" + string(growthTo) + ")";
		switch(tiles) {
			case 1: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_1");break;
			case 2: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_2") + persent;break;
			case 3: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_3");break;
			case 4: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_4") + persent;break;
			case 5: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_5");break;
			case 6: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_6") + persent;break;
			case 7: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_7");break;
		}
	}

	with(oItem) {
		switch(itemID) {
			case 0: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_8");break;
			case 1: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_9");break;
			case 2: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_10");break; 
			case 3: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_11");break; 
			case 4: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_12");break; 
			case 5: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_13");break; 
			case 6: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_14");break; 
			case 7: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_15");break; 
			case 8: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_16");break;
			case 9: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_17");break; 
			case 10: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_18");break; 
			case 11: oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("there_are") + string(number) + JsonGetValue("message_box_19");break; 
		}
	}

	with(oBlindage) {
		oGameCont.messageBox[x div 8, y div 8] = JsonGetValue("message_box_20") + "(" + string(hp) + "/4)";	
	}

	with(oMonster) {
		oGameCont.messageBox[gridX, gridY] = JsonGetValue("message_box_21") + "(" + string(hp) + "/2)";	
	}

	with(oPlayer) {
		oGameCont.messageBox[gridX, gridY] = JsonGetValue("message_box_22");
	}
}