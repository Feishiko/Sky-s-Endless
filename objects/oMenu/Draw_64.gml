FontSet("big");
//draw_set_halign(fa_center);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_color(c_black);

pointerCont[0] = "";
pointerCont[1] = "";
pointerCont[2] = "";

pointerCont[pointer] = "->";

draw_text(20, room_height/2 - 30, string(pointerCont[0]) + string(options[0]));
draw_text(20, room_height/2, string(pointerCont[1]) + string(options[1]));
draw_text(20, room_height/2 + 30, string(pointerCont[2]) + string(options[2]));

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_text(room_width/2, room_height, JsonGetValue("staff"));