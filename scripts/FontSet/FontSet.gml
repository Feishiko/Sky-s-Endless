// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FontSet(_size){
	//English
	if(global.language == 0) {
		if(_size == "small") {
			draw_set_font(fontPixelSmall);	
		}
		if(_size == "big") {
			draw_set_font(fontPixelMenu);	
		}
	}
	//Chinese
	if(global.language == 1) {
		if(_size == "small") {
			draw_set_font(fontPixelSmallChs);	
		}
		if(_size == "big") {
			draw_set_font(fontPixelMenuChs);	
		}
	}
}