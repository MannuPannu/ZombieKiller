
if(isFalling){
	
	vsp += grv; 

	//horizontal collision
	if(place_meeting(x + hsp, y, obj_wall)){
	
		while(!place_meeting(x + sign(hsp), y, obj_wall)){
			x += sign(hsp);
		}
		isFalling = false;	
	}

	x += hsp;

	//vertical collision
	if(place_meeting(x, y + vsp, obj_wall)){
	
		while(!place_meeting(x, y + sign(vsp), obj_wall)){
			y += sign(vsp);
		}
		isFalling = false;
		alarm[0] = 60;
	}

	y += vsp;
}