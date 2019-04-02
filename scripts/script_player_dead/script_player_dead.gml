//Players variables exists in scripts scope since player object is calling this script :)
//So its super ugly i know :)

if(isDead){
	exit;	
}

visible = false;
hascontrol = false;
hsp = 0;
vsp = 0;
isDead = true;

with(obj_gun) {
	instance_destroy();		
}

ds_list_clear(weapons);
deadPlayer = instance_create_layer(x, y, "Player", obj_player_dead);

var bulletDirX = other.x;
var bulletDirY = other.y;

with(deadPlayer){
	
	direction = point_direction(bulletDirX, bulletDirY, x, y);	
	hsp = lengthdir_x(6, direction);
	vsp = lengthdir_y(4, direction)-2;

	if(sign(hsp) != 0) {
		image_xscale = -sign(hsp);	
	}
}


