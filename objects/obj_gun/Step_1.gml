x = obj_player.x

if((mouse_x > obj_player.x + 30)) {
	gun_offset = 7;
}
else if(mouse_x < obj_player.x - 30){
	gun_offset = -7;
}

image_yscale = sign(mouse_x - x);

x += gun_offset;

y  = obj_player.y +	10;

if(obj_player.controller == 0) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);	
}
else {
	var controllerH = gamepad_axis_value(0, gp_axisrh);
	var controllerV = gamepad_axis_value(0, gp_axisrv);
	
	if(abs(controllerH) > 0.2 || abs(controllerV) > 0.2){
		controllerAngle = point_direction(0, 0, controllerH, controllerV);	
	}
	image_angle = controllerAngle;
}

firingDelay -= 1;
recoil = max(0, recoil - 1);

if((mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && (firingDelay < 0)){
	fire = true;
	
	audio_sound_pitch(shot_sound, choose(0.8, 1.0, 1.2));
	audio_play_sound(shot_sound, 5, false);
}


if(fire ){
	firingDelay = firing_rate;
	recoil = 4;
	
	screen_shake(2, 10);

	var shell = instance_create_layer(x, y, "Bullets", obj_shell)
	
	with(shell){
		speed = 18;
		direction = other.image_angle + 120 * other.image_yscale;		
		gravity = 2;
	}
	
	with(obj_player){
		gunkickX = lengthdir_x(other.gun_kick_x, other.image_angle + 180);
		gunkickY = lengthdir_y(other.gun_kick_y, other.image_angle + 180);
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);
