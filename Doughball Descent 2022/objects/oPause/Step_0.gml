if(!paused) {
	if(autoPause>0){
	
		autoPause--
		if(autoPause<=0){
		
				instance_activate_all()
				if(layer_get_id("terrain")!=-1) layer_set_visible("terrain",true)
		}
		exit;
	}
	if(keyboard_check_pressed(vk_escape) && room!=rTitle) event_user(0);

}
else
{
	var escPressed = false;
	if(cUp) {
		cursorOn--
		if(cursorOn<0) cursorOn = current_menu_size;
		audio_play_sound(sndMenuNext,0,0)
	} else if (cDown) {
		cursorOn++
		if(cursorOn>current_menu_size) cursorOn = 0
		audio_play_sound(sndMenuNext,0,0)
	}
	
	if(mode = "toplevel")
	{
		if(cBash) 
		{
			switch(menu_main[cursorOn])
			{
				case "Back":
				escPressed = true;
				break;
				case "Settings":
				mode = "settings";
				cursorOn = 0;
				current_menu_size = array_length(settings)-1
				break;
				case "Restart":
				mode = "reallyrestart"
				cursorOn = 1;
				current_menu_size = 1;
				break;
				case "End Run":
				mode = "reallyquit"
				cursorOn = 1;
				current_menu_size = 1;
				break;
			}
		}
	
		if(keyboard_check_pressed(vk_escape)) escPressed = true;
		
		if(escPressed)
		{
			if(!paused) event_user(0)
			else event_user(2)
		}
	}
	else
	{
		if(mode = "settings")
		{

			if(cLeftPressed || cRightPressed)
			{
				var pressSound = audio_play_sound(talkGeneric,0,0)
				ini_open("config.ini")
				switch(cursorOn) {
					case enSettings.masterVol:
					case enSettings.musicVol:
					case enSettings.screenShake:
						var cDir = 1
						if(cLeftPressed) cDir = -1
			
						settings[cursorOn,1] += cDir
						settings[cursorOn,1] = clamp(settings[cursorOn,1],0,10)
			
						switch(cursorOn) {
							case enSettings.masterVol: ini_write_real("config","volumeMaster",settings[cursorOn,1]) 
							audio_set_master_gain(0,settings[cursorOn,1]/10)
							audio_stop_sound(pressSound)
							audio_play_sound(sndFood,0,0)
							break;
				
							case enSettings.musicVol: ini_write_real("config","volumeMusic",settings[cursorOn,1])
							audio_group_set_gain(agMusic,settings[cursorOn,1]/10,0)
							playMusic(currentMusic)
							break;
				
							case enSettings.screenShake: ini_write_real("config","screenshake",settings[cursorOn,1]) 
							break;
						}
					break;
		
					case enSettings.fullscreen:
						enSettings[cursorOn,1] = !settings[cursorOn,1]
						ini_write_real("config","fullscreen",settings[cursorOn,1])
			
						window_set_fullscreen(settings[cursorOn,1])
					break;
		
					case enSettings.squashStretch:
						settings[cursorOn,1] = !settings[cursorOn,1]
						ini_write_real("config","squashNstretch",settings[cursorOn,1])
					break;
					case enSettings.sizeCap:
						settings[cursorOn,1] = !settings[cursorOn,1]
						ini_write_real("config","sizeCap",settings[cursorOn,1])
					break;
		
					case enSettings.textSpeed:
		
						var cDir = 1
						if(cLeftPressed) cDir = -1
						settings[cursorOn,1] += cDir
			
						if(settings[cursorOn,1]>3) settings[cursorOn,1] = 1
						else if(settings[cursorOn,1]<1) settings[cursorOn,1] = 3
			
						ini_write_real("config","textDelay",settings[cursorOn,1]) 
						updateTextSpeed()
					break;
					case enSettings.back:
						escPressed = true;
					break;		
					}
				ini_close()
			}
			
			if(cBash && cursorOn = enSettings.back) escPressed = true;
		}
		else //mode = reallyrestart or reallyquit
		{
			if(cBash)
			{
				if (cursorOn = 0)
				{
					if (mode = "reallyrestart")
					{
						audio_stop_all()
						instance_activate_all()
	
						instance_destroy(oTally)	
						instance_destroy(oPlayer)
						with(oBase) instance_destroy();
						
						makePlayer();
						
						mode = "toplevel";
						cursorOn = 0;
						current_menu_size = array_length(menu_main)-1
						event_user(2)
						
						room_goto(rGame)
						level = global.chosenStart;
					}
					else //reallyquit
					{	
						goToTally();
					}
				}
				else
				{	
					escPressed = true;
				}
			}
		}
			
		if(keyboard_check_pressed(vk_escape)) escPressed = true;
			if(escPressed)
			{
				mode = "toplevel";
				cursorOn = 0;
				current_menu_size = array_length(menu_main)-1
				
				if(room=rTitle) event_user(2);
			}
	}
	if(keyboard_check_pressed(vk_lcontrol) && keyboard_check_pressed(ord("S"))) 
	{
		show_debug_message("Settings Reset");
		if(file_exists("config.ini")) file_delete("config.ini");
		settingsReset();
	
		playMusic(currentMusic);
	
		if(file_exists("progress.ini")) file_delete("progress.ini");
		exit;
	}
}

toggledThisFrame = false;