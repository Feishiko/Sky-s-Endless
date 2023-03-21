// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function JsonGetValue(key){	
	//file_text_readln(file);
	
	//show_debug_message(json);
	
	if(variable_struct_exists(global.json, key)) {
		return variable_struct_get(global.json, key);
	}
}