if(room=rEvent){
	//show_debug_message("Room Height "+string(room_height))
	var _teScript = teScript(option)
	
	script_execute(_teScript[0],_teScript[1])
	instance_destroy();
	
} else if(room=rChoice){
	
	//show_debug_message("ran non event script")
	tutorialPrompt("tChoiceTutorial","The tunnel diverges below\nChoose your path");
	visible = true;

	//oPlayer.tranRoom = rEvent;
	image_alpha = 0

	if(!progCheck("tChoiceTutorial")) oCamera.yOffset = 100
	else oCamera.yOffset = 0

	setShopWidth()
	fastMode = false;

	sinCount = 0
	sinOut = 0
}