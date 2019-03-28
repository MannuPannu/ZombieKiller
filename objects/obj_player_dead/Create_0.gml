hsp = 0;
vsp = 0;
grv = 0.2;

isFalling = true;

screen_shake(6, 60);
audio_play_sound(snd_death, 5, false);
game_set_speed(30, gamespeed_fps);

with(obj_camera){
	follow = other.id;	
}

first_emitter = part_emitter_create(obj_blood_spray.FirstParticleSystem);
particle = obj_blood_spray.first_particle;
part_type_direction(particle, 0, 360,0,0);

part_emitter_region(obj_blood_spray.FirstParticleSystem, first_emitter, other.x-20, other.x+20, other.y-20, other.y+20, ps_shape_ellipse, ps_distr_gaussian);

part_emitter_burst( obj_blood_spray.FirstParticleSystem, first_emitter, obj_blood_spray.first_particle,100);
