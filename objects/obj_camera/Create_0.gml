/// @description Setup camera

cam = view_camera[0];
follow = obj_player;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


//Variables for cool shake effect
shake_length = 240;
shake_magnitude = 8;
shake_remain = 0;
buff = 32;






