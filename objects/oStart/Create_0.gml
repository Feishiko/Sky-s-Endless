randomize();
global.language = 0;//0 - English, 1 - Chinese
//window_set_cursor(cr_none);
//window_set_size(720, 720);

//Read Language Data

if(file_exists("language")) {
	var language = file_text_open_read("language");
	global.language = file_text_read_real(language);
	file_text_close(language);
}

var file = -1;
global.text = "";
switch(global.language) {
	case 0: file = file_text_open_read(working_directory  + "Languages/english.json");break;	
	case 1: file = file_text_open_read(working_directory  + "Languages/chinese.json");break;	
}
while (!file_text_eof(file)){
	global.text += file_text_readln(file);
}

global.json = json_parse(global.text);

file_text_close(file);

global.Emitter = audio_emitter_create();
audio_emitter_gain(global.Emitter, 0);

global.highScore = -1;
global.tutorial = false;

if(file_exists("highScore")) {
	file = file_text_open_read("highScore");
	global.highScore = file_text_read_real(file);
	file_text_close(file);
}

if(file_exists("tutorial")) {
	file = file_text_open_read("tutorial");
	global.tutorial = file_text_read_real(file);
	file_text_close(file);	
}

room_goto_next();