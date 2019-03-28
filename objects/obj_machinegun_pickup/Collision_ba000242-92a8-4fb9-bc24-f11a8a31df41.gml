
with(other){
	
	if(ds_list_find_index(weapons, WEAPON.MACHINE_GUN) == -1){
		ds_list_add(weapons, WEAPON.MACHINE_GUN);
		current_weapon_index = ds_list_size(weapons) - 1;
	
		if(instance_exists(gun)){
			instance_destroy(gun);
		}
	
		gun = instance_create_layer(x, y, "Gun", obj_machinegun);	
	}
}

instance_destroy();