
if(hascontrol){
	
#region // input
	toggle_weapon = keyboard_check_pressed(ord("E"));
	
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));;

	key_jump = keyboard_check_pressed(vk_space);


	if(key_left || key_right || key_jump){
		controller = 0;
	}

	if(abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
	
		controller = 1;
	}

	if(gamepad_button_check_pressed(0, gp_shoulderlb)){
		key_jump = 1;
		controller = 1;
	}
#endregion

	var moveH = key_right - key_left;

	hsp = moveH * walkspd;

	look_left = false;
	
#region //Jumping
	canJump -= 1;
	
	if((canJump > 0) && key_jump) {
		vsp -= 12;
		canJump = 0;
	}

	not_grounded_pre = !grounded;
	//grounded ?
	grounded = place_meeting(x, y + 1, obj_wall);
	
	
	if(not_grounded_pre && grounded){ //did we land just now ?
		
		audio_sound_pitch(snd_landing, choose(0.8, 1.0, 1.2));
		audio_play_sound(snd_landing, 5, false);
		
		repeat(5){
			with(instance_create_layer(x, bbox_bottom, "Bullets", obj_dust)){
				vsp = 0;				
			}
		}
	}
	
#endregion

#region //Collide and move

	//horizontal collision
	if(place_meeting(x + hsp, y, obj_wall)){
	
		while(!place_meeting(x + sign(hsp), y, obj_wall)){
			x += sign(hsp);
		}
		hsp = 0;
	}

	x += hsp;

	//vertical collision
	if(place_meeting(x, y + vsp, obj_wall)){
			
		while(!place_meeting(x, y + sign(vsp), obj_wall)){
			y += sign(vsp);
		}
		vsp = 0;
		canJump = 10;
	}

	y += vsp;
	
	vsp += grv; 
	
#endregion


#region // Animate
	if(!grounded){
		sprite_index = spr_player;
	} else if(hsp == 0){
		sprite_index = spr_player
	}
	else {
		sprite_index = spr_player_run;
	}

	if(mouse_x > x + 10){
		look_left = true;
	} else if(mouse_x < x - 10){
		look_left = false;	
	}
	image_xscale = look_left ? 1 : -1;
	
#endregion
	
	
#region //Toggle weapon
	if(toggle_weapon){
		if(ds_list_size(weapons) > 0){
			current_weapon_index += 1;
		
			if(current_weapon_index > ds_list_size(weapons) - 1){
				current_weapon_index = 0;
			}
			
			var weapon = ds_list_find_value(weapons, current_weapon_index);
		
			instance_destroy(gun);
		
			switch(weapon){
				case(WEAPON.MACHINE_GUN):
					if(!instance_exists(obj_machinegun)){
						gun = instance_create_layer(x, y, "Gun", obj_machinegun);	
					}
					break;
				case(WEAPON.SHOTGUN):
					if(!instance_exists(obj_shotgun)){
						gun = instance_create_layer(x, y, "Gun", obj_shotgun);	
					}else{
					
					}
			
					break;
			}
		}
		toggle_weapon = false;
	}
#endregion
	
}else {
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}


