/// @description level transition
// git push more like shit push

if(tranLevel!=-1) {
	draw_sprite(sTransition,0,140,viewHeight-tranLevel)
	draw_set_color(c_black)
	draw_rectangle(140,viewHeight-tranLevel+96,500,viewHeight,0)
	draw_set_color(c_white)
	
	tranLevel+=tranSpeed
	
	if(tranLevel>viewHeight+100){
		
		x = 320;
		setShopWidth()
		
		switch(tranRoom) {
			
			case rChoice:
			
				instance_create_layer(0,0,layer,oTransitionGen);
				
				x = 190
				if(!progCheck("tChoiceTutorial")) y = -600
				else y = -96
				var nextRoom = rEvent;
				break;
			
			case rEvent:
			
				y = 0
				var nextRoom = rGame;
				break;
				
			case rGame:
			
				y = -96
				var nextRoom = rChoice;
				break;
		}
		
		room_goto(tranRoom);
		tranRoom = nextRoom;
		tranLevel = -1
	}
}