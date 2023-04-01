// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TimePassed(){
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
	
	with(oBorder) {
		instance_destroy();	
	}
}