randomize();

hsp =  irandom_range(-10, 10);
vsp = irandom_range(-20, -10);

current_angle = 0;
rotation_speed = 5;
rotation_dir = 1;

grv = 0.6;

min_speed_h = 0.2;


//Blood splatter effects
spray_amount = 50;

blood_splat_sprites = ds_list_create();

blood_splat_delay_vertical = 4; //Determines how often too draw blood sprite, every X vertical collision

blood_splat_delay = 0;

enum COL_DIR {
	NONE,
	LEFT,
	RIGHT,
	BOTTOM
}

current_col_dir = COL_DIR.NONE;

