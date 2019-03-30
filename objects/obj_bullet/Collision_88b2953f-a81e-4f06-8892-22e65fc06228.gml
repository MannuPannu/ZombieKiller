with(other){
	hp--;
	flash = 3;
	
	hitFrom = other.direction;
}

audio_play_sound(snd_bullet_flesh, 5, false);

//Blood spray effect :)

first_emitter = part_emitter_create(obj_blood_spray.FirstParticleSystem);
particle = obj_blood_spray.first_particle;
part_type_direction(particle, direction -40, direction + 40,0,0);

part_emitter_region(obj_blood_spray.FirstParticleSystem, first_emitter, other.x-20, other.x+20, other.y-20, other.y+20, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst( obj_blood_spray.FirstParticleSystem, first_emitter, obj_blood_spray.first_particle,30);


//Paint blood on nearby tiles
var blood_amount = irandom_range(1,3);

repeat(blood_amount){
	var instance = collision_line(x, y, x + lengthdir_x(100, direction + irandom_range(-45, 45)), y + lengthdir_y(100, direction + irandom_range(-45, 45)), obj_wall, false, true)

	if(instance_exists(instance)){
		instance_create_layer(instance.x + random_range(-50, 50), instance.y + random_range(10, 15), "Bullets", obj_blood_splatter);
	}
}

repeat(blood_amount){
	var instance = collision_line(x, y, x + lengthdir_x(100, 0 + irandom_range(-45, 45)), y + lengthdir_y(100, 0 + irandom_range(-45, 45)), obj_wall, false, true)

	if(instance_exists(instance)){
		instance_create_layer(instance.x + random_range(-50, 50), instance.bbox_top + random_range(10, 15), "Bullets", obj_blood_splatter);
	}
}

instance_destroy();

