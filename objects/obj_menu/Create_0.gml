/// @description GUI/Vars setup

#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;

menu_x_target = gui_width - gui_margin;

menu_speed = 25; //lower is faster

menu_font = fnt_menu;
menu_itemheight = font_get_size(fnt_menu);
menu_comitted = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_length = array_length_1d(menu);
menu_cursor = 2;


grow_title = false;
title_size_gain = 1;
title_offset_left = 0;

//slide_transition(TRANS_MODE.GOTO, room02);





