// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PotionWord(_word){
	var ins = instance_create_depth(0, 0, -500, oPotionWord);
	ins.word = _word;
}