guidence[0] = false;//Blindage
guidence[1] = false;//Bread
guidence[2] = false;//Plough
guidence[3] = false;//Grenade
guidence[4] = false;//Potion

guidenceTurn[0] = 0;
guidenceTurn[1] = 0;
guidenceTurn[2] = 0;
guidenceTurn[3] = 0;
guidenceTurn[4] = 0;

depth = -200;

if(file_exists("guidence")) {
	var file = file_text_open_read("guidence");
	guidence[0] = file_text_readln(file);
	guidence[1] = file_text_readln(file);
	guidence[2] = file_text_readln(file);
	guidence[3] = file_text_readln(file);
	guidence[4] = file_text_readln(file);
	file_text_close(file);
}