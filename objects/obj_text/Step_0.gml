letters += spd;

text_current = string_copy(text, 1, floor(letters));

draw_set_font(fnt_sign);

if(h == 0){
	h = string_height(text);
}

w = string_width(text_current);

//Destrou when done

if(letters >= length)
{
	if(alarm[0] == -1){
		alarm[0] = 3 * room_speed;
	}
	
}