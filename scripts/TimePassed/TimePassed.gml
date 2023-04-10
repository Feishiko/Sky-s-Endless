// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TimePassed(){
	
	oPlayer.innerTurn++;
	if(oPlayer.innerTurn < oPlayer.spd) {
		exit;	
	}
	if(oPlayer.innerTurn >= oPlayer.spd) {
		innerTurn = 0;	
	}
	
	oGameCont.time += 1;
	
	if(oGameCont.time mod 200 == 0) {
		oGameCont.day += 0.5;
	}
	
	with(oTile) {
		growth += 1;	
	}
	
	with(oMonster) {
		event_user(0);	
	}
	
	with(oNight) {
		createTimer += 1;	
	}
}