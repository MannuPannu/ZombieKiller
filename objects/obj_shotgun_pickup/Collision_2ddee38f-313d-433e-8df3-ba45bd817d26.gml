
with(other){
	if(ds_list_find_index(weapons, WEAPON.SHOTGUN) == -1){
	
		ds_list_add(weapons, WEAPON.SHOTGUN);
		current_weapon_index = ds_list_size(weapons) - 1;
	
		if(instance_exists(gun)){
			instance_destroy(gun);
		}
	
		gun = instance_create_layer(x, y, "Gun", obj_shotgun);	
	}
}

instance_destroy();