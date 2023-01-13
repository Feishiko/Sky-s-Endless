draw_set_font(fontPixelSmall);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_rectangle_color(room_width - 136, 160, room_width - 20, room_height - 27, c_black, c_black, c_black, c_black, false);
draw_set_color(c_white);

draw_text(room_width - 20, 160, "WASD/ARROW KEYS - MOVE\nMOUSE HOVER - CHECK\nLMB/E - USE\nSPACEBAR - PICK/HARVEST\nQ - TOSS\n./RMB - SKIP A TURN\n1-0/MOUSE WHEEL - SELECT ITEMS\nC - CRAFT\nSHIFT - MOVE ITEMS\n? - CHECK OR CLOSE THE HELP")

draw_set_color(c_white);