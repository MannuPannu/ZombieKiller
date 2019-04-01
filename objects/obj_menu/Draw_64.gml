/// @description Draw menu


if(grow_title){
	title_size_gain += 0.05;
	title_offset_left -= 5;
}

draw_sprite_ext(sprite30, 1, 350 + title_offset_left, 25 + title_offset_left, 
				0.9 * title_size_gain, 0.9 * title_size_gain, 0, c_white, 1);

draw_set_font(fnt_menu2);
draw_set_halign(fa_right);

draw_set_valign(fa_bottom);

for(var i = 0; i < menu_length; i++){
	var offset = 2;
	var txt = menu[i];
	
	if(menu_cursor == i) {
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	} else {
		var col = c_gray;
	}
	
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 2));
	draw_set_color(c_black);
	
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx, yy-offset, txt);
	
	draw_set_color(col);
	
	draw_text(xx, yy, txt);	
}



