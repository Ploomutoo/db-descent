if(room=rEvent){
	//show_debug_message("Room Height "+string(room_height))
	script_execute(teScript(option))
	
	instance_destroy();
} else {
	
	tutorialPrompt("tChoiceTutorial","The tunnel diverges below\nChoose your path");

	option = [teDraw(),0]
	while(option[0]=option[1]) option[1] = teDraw()

	//oPlayer.tranRoom = rEvent;
	image_alpha = 0

	if(!progCheck("tChoiceTutorial")) oCamera.yOffset = 100
	else oCamera.yOffset = 0

	setShopWidth()
	fastMode = false;

	sinCount = 0
	sinOut = 0
}