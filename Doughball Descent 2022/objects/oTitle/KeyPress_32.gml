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
		
		pauseUnpause();
		
	break;
	case 3: //quit
	
		game_end();
		
	break;
}