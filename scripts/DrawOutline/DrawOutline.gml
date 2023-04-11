// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawOutline(_x, _y, _text, _col, _outlineCol){
	draw_set_color(_outlineCol);
	for(var dir = 0; dir <= 360; dir += 45) {
		draw_text(_x + lengthdir_x(1, dir), _y + lengthdir_y(1, dir), _text);	
	}
	draw_set_color(_col);
	draw_text(_x, _y, _text);
}