/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

min_spit_time = 1
max_spit_time = 4

alarm_set(0, irandom_range(min_spit_time * room_speed, max_spit_time * room_speed));