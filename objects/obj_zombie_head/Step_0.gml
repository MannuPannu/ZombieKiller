vsp += grv;

var grounded = false;
current_col_dir = COL_DIR.NONE;

//horizontal col
if(place_meeting(x + hsp, y, obj_wall)){
	
	current_col_dir = sign(hsp) > 0 ? COL_DIR.RIGHT : COL_DIR.LEFT;
	
	while(!place_meeting(x + sign(hsp), y, obj_wall)){
		x += sign(hsp);	
	}
	hsp = -hsp;
} else {
	x += hsp;	
}

if(place_meeting(x, y + vsp, obj_wall)){
	
	current_col_dir = COL_DIR.BOTTOM;
	
	while(!place_meeting(x, y + sign(vsp), obj_wall)){
		y += sign(vsp);	
	}
	
	grounded = true;
	
	vsp = -vsp *0.7; //Bounce vertical collision	
	
} else {
	y += vsp;	
}

if(grounded){
	hsp += -sign(hsp) * 0.2;
}

if(hsp < min_speed_h && hsp > -min_speed_h){
	hsp = 0;
}

//Update rotation
if(sign(hsp) > 0){
	rotation_dir = -1;
} else if(hsp < 0){
	rotation_dir = 1;
}

current_angle += rotation_speed * rotation_dir;

if(current_angle > 360){
	current_angle = 0;
}

if(current_angle < 0){
	current_angle = 360;	
}

rotation_speed = abs(hsp) * 2;

//Blood splatter
if(hsp > 1.0 || vsp > 0.5){
	part_particles_create(obj_blood_spray.FirstParticleSystem, x, y, obj_blood_spray.first_particle, 10);
}

if(ds_list_size(blood_splat_sprites) < 20){	
	
	if(!current_col_dir == COL_DIR.NONE)
	{
		
		var bloodX = 0;
		var bloodY = 0;
		var bloodSplatAngle = 0;

		if(current_col_dir == COL_DIR.LEFT){ //collide with right wall
			bloodX = bbox_left;
			bloodY = y;
			bloodSplatAngle = 90;	
			
		}
	
		else if(current_col_dir == COL_DIR.RIGHT){ //collide with left wall
			bloodX = bbox_right;
			bloodY = y;
			bloodSplatAngle = -90;	
		
		}
		else if(current_col_dir == COL_DIR.BOTTOM){
		
		
			bloodX = x;
			bloodY = bbox_bottom;
			bloodSplatAngle = 0;	
			blood_splat_delay = blood_splat_delay_vertical;	
		}
	
		var blood_splat = instance_create_layer(bloodX, bloodY, "Bullets", obj_blood_splatter);	
	
		blood_splat.image_angle += bloodSplatAngle;
	
		ds_list_add(blood_splat_sprites, blood_splat);
	}
}






