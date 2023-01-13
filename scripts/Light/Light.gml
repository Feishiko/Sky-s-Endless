// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Light(_frames){
	var light = instance_create_depth(x, y, -50, oShoot);
	light.deadEnd = _frames;
}