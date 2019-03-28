
obj_player.x = x;
obj_player.y = y;

obj_player.hascontrol = true;

//Make it remember weapon when new level starts
var weapon = ds_list_find_value(obj_player.weapons, obj_player.current_weapon_index);
	
switch(weapon){
	case(WEAPON.MACHINE_GUN):
		if(!instance_exists(obj_machinegun)){
			obj_player.gun = instance_create_layer(x, y, "Gun", obj_machinegun);	
		}
			
		break;
	case(WEAPON.SHOTGUN):
		if(!instance_exists(obj_shotgun)){
			obj_player.gun = instance_create_layer(x, y, "Gun", obj_shotgun);	
		}else{
					
		}
			
		break;
}

