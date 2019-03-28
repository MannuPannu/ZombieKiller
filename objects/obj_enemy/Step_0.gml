vsp += grv; 

//grounded ?
grounded = place_meeting(x, y + 1, obj_wall);

//dont walk of edges
if(grounded && afraidofheights && (!place_meeting(x + hsp, y + 1, obj_wall))) {
	hsp = -hsp;	
}

//horizontal collision
if(place_meeting(x + hsp + 2*sign(hsp), y, obj_wall)){
	
	hsp = -hsp;
}

if(((x+32) > room_width) || (x < 0)){
	hsp = -hsp;
	x -= 16;
}

x += hsp;

//vertical collision
if(place_meeting(x, y + vsp, obj_wall)){
	
	while(!place_meeting(x, y + sign(vsp), obj_wall)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

look_left = sign(hsp);
image_xscale = look_left ? 1 : -1;

image_xscale = image_xscale * size;

image_yscale = size;
