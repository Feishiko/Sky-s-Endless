FontSet("small");
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(room_width/2, 0, "Game By Feishiko");

FontSet("big");
//draw_set_halign(fa_center);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_color(c_black);

pointerCont[0] = "";
pointerCont[1] = "";
pointerCont[2] = "";
pointerCont[3] = "";

//pointerCont[pointer] = "->";

draw_rectangle_color(20, room_height/2 - 20 + pointer*30, 120, room_height/2 - 2 + pointer*30, c_white, c_white, c_white, c_white, false);

draw_text(20, room_height/2 - 30 + 20, string(pointerCont[0]) + string(options[0]));
draw_text(20, room_height/2 + 20, string(pointerCont[1]) + string(options[1]));
draw_text(20, room_height/2 + 30 + 20, string(pointerCont[2]) + string(options[2]));
draw_text(20, room_height/2 + 60 + 20, string(pointerCont[3]) + string(options[3]));

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

//draw_text(room_width/2, room_height, JsonGetValue("longest_survive") + string(global.highScore) + JsonGetValue("turns"));
DrawOutline(room_width/2, room_height, JsonGetValue("longest_survive") + string(global.highScore) + JsonGetValue("turns"), c_white, c_black);