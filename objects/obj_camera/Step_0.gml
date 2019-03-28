/// @description Update camera

//Update destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
	
	if(follow.object_index == obj_player_dead){
		x = xTo;
		y = yTo;
	}
}

//update obj position (smooth)
x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half/2, room_height - view_h_half);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1/shake_length)*shake_magnitude));

//update camera view 
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if(layer_exists("mountains")){
	layer_x("mountains", x/2);
}

if(layer_exists("trees")){
	layer_x("trees", x/4);
}