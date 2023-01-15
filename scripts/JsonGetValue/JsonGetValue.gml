// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function JsonGetValue(key){
	var json = -1;
	var file = -1;
	switch(global.language) {
		case 0: file = file_text_open_read(working_directory  + "Languages/english.json");break;	
		case 1: file = file_text_open_read(working_directory  + "Languages/chinese.json");break;	
	}
	
	//file_text_readln(file);
	var text = "";
	
	while (!file_text_eof(file)){
		text += file_text_readln(file);
	}
	
	json = json_parse(text);
	
	//show_debug_message(json);
	
	file_text_close(file);
	
	if(variable_struct_exists(json, key)) {
		return variable_struct_get(json, key);
	}
}