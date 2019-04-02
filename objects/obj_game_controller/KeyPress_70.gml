if(keyboard_check(vk_control)){
	window_set_fullscreen(!window_get_fullscreen());	
	
view_wview = 1024;
   view_hview = 768;
   view_wport = view_wview;
   view_hport = view_hview;
   surface_resize(application_surface,view_wview,view_hview);
}