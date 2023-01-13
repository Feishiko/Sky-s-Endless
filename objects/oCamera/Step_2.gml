if(instance_exists(oPlayer)) {
	x = oPlayer.x;
	y = oPlayer.y;
}

backTimer++;

if(backTimer >= 10 && oPlayer.hp > 0 && oPlayer.items[oGameCont.select, 0] != 6) {
	viewWidth = 64;
	viewHeight = 64;
}

if(oPlayer.items[oGameCont.select, 0] == 6 && oPlayer.hp > 0 && backTimer >= 10) {
	viewWidth = 92;
	viewHeight = 92;	
}

viewTrueWidth = lerp(viewTrueWidth, viewWidth, .1);
viewTrueHeight = lerp(viewTrueHeight, viewHeight, .1);

camera_set_view_size(view_camera[0], viewTrueWidth, viewTrueHeight);