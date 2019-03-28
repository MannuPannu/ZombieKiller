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
}

