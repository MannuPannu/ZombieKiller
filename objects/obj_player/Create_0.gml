//Player is invis first, then start marker sets visible true
visible = false;
randomize();

enum WEAPON {
	SHOTGUN,
	MACHINE_GUN
}

isDead = false;

hsp = 0;
vsp = 0;

grv = 0.4;
walkspd = 7;

controller = 0;

hascontrol = true;
grounded = true;

weapons = ds_list_create();

current_weapon_index = 0;

canJump = 0;

gun = noone;





