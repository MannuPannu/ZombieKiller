	/// @description Control menu

//Item ease in

menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard control
if(menu_control){
	if(keyboard_check_pressed(vk_up)){
		menu_cursor++;
		if(menu_cursor >= menu_length) 
		{
			menu_cursor = 0;
		}
		
	} 
	
	if(keyboard_check_pressed(vk_down)){
		menu_cursor--;
		if(menu_cursor < 0) {
			menu_cursor = menu_length-1;
		}
	}
	
	if(keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width + 200;
		menu_comitted = menu_cursor;
		screen_shake(4, 30);
		menu_control = false;
		
		grow_title = true;
	}
}

if(menu_x > gui_width+150 && (menu_comitted != -1)){
	
	switch(menu_comitted){
		case 2: default:
			slide_transition(TRANS_MODE.GOTO, room01);
			break;
		case 1:
		{
			if(!file_exists(SAVEFILE)){
				slide_transition(TRANS_MODE.NEXT);
			}else {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				
				slide_transition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		case 0: game_end();
	}
}



