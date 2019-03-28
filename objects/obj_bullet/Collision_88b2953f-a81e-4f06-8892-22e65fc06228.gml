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

var instance = collision_line(x, y, x + lengthdir_x(100, direction-45), y + lengthdir_y(100, direction-45), obj_wall, false, true)

if(instance_exists(instance)){
	
	var blood_amount = irandom_range(1,2);
	
	repeat(blood_amount){
		instance_create_layer(instance.x + random_range(-50, 50), instance.y + random_range(0, 15), "Bullets", obj_blood_splatter);
	}
}

var instance = collision_line(x, y, x + lengthdir_x(200, direction), y + lengthdir_y(200, direction), obj_wall, false, true)

if(instance_exists(instance)){
	
	var blood_amount = irandom_range(2,3);
	
	repeat(blood_amount){
		instance_create_layer(instance.x + random_range(-10, 10), instance.y + random_range(0, 5), "Bullets", obj_blood_splatter);
	}
}

instance_destroy();

