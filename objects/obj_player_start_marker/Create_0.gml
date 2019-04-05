obj_player.isDead = false;


obj_player.visible = true;
obj_player.x = x;
obj_player.y = y;

obj_player.hascontrol = true;

obj_camera.follow = obj_player.id;

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

//Autosave

//Overwrite old save
if (file_exists(SAVEFILE)){
	file_delete(SAVEFILE);	
}

////Create new save
var file = file_text_open_write(SAVEFILE);
file_text_write_real(file, room);
file_text_close(file);


