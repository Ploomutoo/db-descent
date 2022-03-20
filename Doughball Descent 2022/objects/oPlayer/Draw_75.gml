/// @description level transition

if(tranLevel!=-1) {
	draw_sprite(sTransition,0,140,viewHeight-tranLevel)
	draw_set_color(c_black)
	draw_rectangle(140,viewHeight-tranLevel+96,500,viewHeight,0)
	draw_set_color(c_white)
	
	tranLevel+=tranSpeed
	
	if(tranLevel>viewHeight+100){
		
		x = 320
		room_goto(tranRoom);
		switch(tranRoom) {
			
			case rTransition:
			tranRoom = rEvent;
			x = 190
			
			if(!progCheck("tChoiceTutorial")) y = -600
			else y = -96
			
			break;
			
			case rEvent:
			tranRoom = rGame;
			y = -96
			break;
			
			default:
			tranRoom = rTransition;
			y = -96
			break;
		}
		
		tranLevel = -1
	}
}