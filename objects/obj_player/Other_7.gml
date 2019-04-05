/// @description Play footsteps

if(!isDead){
	
	if(sprite_index == spr_player_run) {
		audio_play_sound(choose(snd_foot1, snd_foot1, snd_foot3, snd_foot4), 1, false);	
	}

}
