/// @description Insert description here

if(hp <= 0){
	instance_destroy();
	var dead_zombie = instance_create_layer(x, y, "Walls", dead_obj);
	
	with(dead_zombie){
		direction = other.hitFrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction) -5;
		image_xscale = -sign(hsp) * other.size;
		image_yscale = other.size;
	}
	
	//Shoot of the head
	var head = instance_create_layer(x, y, "Walls", head_obj);
	
	audio_play_sound(snd_head_splat, 10, false);
	
	with(head){
		direction = other.hitFrom;
		hsp = lengthdir_x(5, direction);
		vsp = lengthdir_y(7, direction) -7;
		
	}
}

