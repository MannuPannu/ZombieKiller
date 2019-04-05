/// @description Move to next room

with(obj_player){
	if(hascontrol){
		hascontrol = false;
		
		if(other.target_room == noone){	
			slide_transition(TRANS_MODE.NEXT);
		}
	}
}



