draw_self();


if(flash  > 0){
	flash--;
	shader_set(sh_blink);
	draw_self();

	shader_reset();
}