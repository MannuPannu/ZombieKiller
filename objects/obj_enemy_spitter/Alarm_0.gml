/// @description Spit!


var spit = instance_create_layer(x, y, "Bullets", obj_spitofdeath);
spit.direction = hsp > 0 ? 0 : 180;

alarm_set(0, irandom_range(min_spit_time * room_speed, max_spit_time * room_speed));