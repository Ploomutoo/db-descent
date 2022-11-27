if(!paused) {
	if(autoPause>0){
	
		//show_debug_message("autoPause " + string(autoPause))
		autoPause--
		if(autoPause<=0){
		
				instance_activate_all()
				if(layer_get_id("terrain")!=-1) layer_set_visible("terrain",true)
		}
	}	
	
	exit;
}

if(keyboard_check_direct(vk_lcontrol) && keyboard_check_pressed(ord("S"))) {
	
	//show_debug_message("Settings Reset");
	if(file_exists("config.ini")) file_delete("config.ini");
	settingsReset();
	
	playMusic(currentMusic);
	
	if(file_exists("progress.ini")) file_delete("progress.ini");
	 
	exit;
}

if(cUp) {
	cursorOn--
	if(cursorOn<0) cursorOn = array_length(menu)-1
	audio_play_sound(sndMenuNext,0,0)
} else if (cDown) {
	cursorOn++
	if(cursorOn>=array_length(menu)) cursorOn = 0
	audio_play_sound(sndMenuNext,0,0)
}

if(cLeftPressed || cRightPressed){
	
	var pressSound = audio_play_sound(talkGeneric,0,0)
	
	ini_open("config.ini")
	switch(cursorOn) {
		case settings.masterVol:
		case settings.musicVol:
		case settings.screenShake:
		
			var cDir = 1
			if(cLeftPressed) cDir = -1
			
			menu[cursorOn,1] += cDir
			menu[cursorOn,1] = clamp(menu[cursorOn,1],0,10)
			
			switch(cursorOn) {
				case settings.masterVol: ini_write_real("config","volumeMaster",menu[cursorOn,1]) 
				audio_set_master_gain(0,menu[cursorOn,1]/10)
				audio_stop_sound(pressSound)
				audio_play_sound(sndFood,0,0)
				break;
				
				case settings.musicVol: ini_write_real("config","volumeMusic",menu[cursorOn,1])
				audio_group_set_gain(agMusic,menu[cursorOn,1]/10,0)
				playMusic(currentMusic)
				break;
				
				case settings.screenShake: ini_write_real("config","screenshake",menu[cursorOn,1]) 
				break;
			}
			
		break;
		
		case settings.fullscreen:
			menu[cursorOn,1] = !menu[cursorOn,1]
			ini_write_real("config","fullscreen",menu[cursorOn,1])
			
			window_set_fullscreen(menu[cursorOn,1])
		break;
		
		case settings.squashStretch:
			menu[cursorOn,1] = !menu[cursorOn,1]
			ini_write_real("config","squashNstretch",menu[cursorOn,1])
		break;
		case settings.sizeCap:
			menu[cursorOn,1] = !menu[cursorOn,1]
			ini_write_real("config","sizeCap",menu[cursorOn,1])
		break;
		
		case settings.textSpeed:
		
			var cDir = 1
			if(cLeftPressed) cDir = -1
			menu[cursorOn,1] += cDir
			
			if(menu[cursorOn,1]>3) menu[cursorOn,1] = 1
			else if(menu[cursorOn,1]<1) menu[cursorOn,1] = 3
			
			ini_write_real("config","textDelay",menu[cursorOn,1]) 
			updateTextSpeed()
		break;
		
		default:
		
			show_debug_message("shit")
		break;		
	}
	ini_close()
	
}
	
if(cBash) {
	
	if(cursorOn = settings.back) event_user(0)
	if(cursorOn = settings.quit) {
		if(menu[settings.quit,1]) goToTally()
		else game_end()
	}
	
	else if (cursorOn = settings.fullscreen) {
		menu[cursorOn,1] = !menu[cursorOn,1]
		ini_open("config.ini")
		ini_write_real("config","fullscreen",menu[cursorOn,1])
		
		window_set_fullscreen(menu[cursorOn,1])
		ini_close()
	}
	
}