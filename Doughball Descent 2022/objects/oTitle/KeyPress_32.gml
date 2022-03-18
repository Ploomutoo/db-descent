switch(cursorOn){
	case 0: //play
	
		//global.playerType = selection
		audio_stop_sound(musLevel0)
		
		instance_create_layer(-280,0,"instances",oSidebarL)
		var player = instance_create_layer(320,-96,"instances",oPlayer)
		with(player) altarInstantiate()
		
		room_goto(rGame)
		window_set_cursor(cr_none)
		instance_destroy()
		
	break;
	case 1: //help
		
		instance_deactivate_all(false)
		instance_activate_object(oHelp)
		oHelp.paused = true
		oHelp.unpauseGrace = 3
		
	break;
	case 2: //settings
		
		pauseUnpause();
		
	break;
	case 3: //quit
	
		game_end();
		
	break;
}