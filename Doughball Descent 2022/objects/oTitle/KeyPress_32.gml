switch(cursorOn){
	case 0: //play
		
		instance_deactivate_all(false)
		instance_activate_object(objLevSel)
		instance_activate_object(oTitleBg)
		objLevSel.paused = true
		objLevSel.unpauseGrace = 3
		
	break;
	case 1: //help
		
		instance_deactivate_all(false)
		instance_activate_object(objHelp)
		instance_activate_object(oTitleBg)
		objHelp.paused = true
		objHelp.unpauseGrace = 3
		
	break;
	case 2: //settings
		//show_debug_message("made it this far")
		with(oPause) 
		{
			event_user(0)
			mode = "settings";
			cursorOn = 0;
			current_menu_size = array_length(settings)-1
		}
		
	break;
	case 3: //quit
	
		game_end();
		
	break;
}