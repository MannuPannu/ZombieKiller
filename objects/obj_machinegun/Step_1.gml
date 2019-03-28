/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(fire) {
	with(instance_create_layer(x, y, "Bullets", obj_bullet)){
		spd = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
	
	fire = false;
}