if(!harmful && image_index>4) { 
	harmful = true;
	var volume = 64/abs(y-oPlayer.y)
	//show_debug_message("volume " + string(volume))
	volume = min(volume,1)	
	
	audio_sound_gain(sndBeam,volume,0)
	audio_play_sound(sndBeam,-1,0)
}