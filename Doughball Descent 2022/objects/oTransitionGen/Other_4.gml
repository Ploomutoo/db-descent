if(room=rEvent){
	//show_debug_message("Room Height "+string(room_height))
	script_execute(teScript(option))
	
	instance_destroy();
} else {
	
	tutorialPrompt("tChoiceTutorial","The tunnel diverges below\nChoose your path");
	
	/*
	if (progReadAndDone("tChoiceTutorial")) {
	
		oTextBox.announce(0,"The tunnel diverges below\nChoose your path")
		audio_play_sound(sndEvent,1,0)
		with(oTextBox) drawText = storedText
	}
	*/
}