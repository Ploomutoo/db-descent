function eventThornbush(){
event = {
	
	//Success is getting the berries and refreshing the event
	//Failure is ending the event and taking (non-lethal) damage
	
	sprite: sEvCave,
	eName : "Thornbush",
	txExposition : "The light catches seductively upon the shiny\nskin of sweet berries lurking in a thornbush. "
	+"Your belly growls, but the menacing brambles\nalmost appear to rear up like a snake. "
	+"Do you dare brave the bush?",
	txAttempt : "You stuff your doughy face\ndirectly into the brambles",
	txDecline : "You pout, deciding that the peril of\nthe thorns outweighs the berries' allure ",
		
	eChance : function(){
		var i = [random_range(0.3,0.8)];
		return(i);
	},
		
	txSuccess : "You emerge unscathed with a\nmouthful of juicy berries.  "+
	+"What's more, another bushel remains on the bush",
	success : function(){
		
		soundRand(sndFood);
		with(oPlayer) {
			
			var nutrition = 50+level*10;
			weight+=nutrition;
			popUp(x,y-48,"+"+string(nutrition))
		}
		with(other) {
			state = 0;
			drawChance = floor(event.eChance()[0]*100)
		}
	},
		
	txFailure : "You are met with a faceful of thorns. When you emerge, the berries have vanished!",
	failure : function(){
		with(oPlayer){
				
			takeDamage(1);
			popUp(x,y-48,"OW")
		}
	},
	endFunc : function(){
		with(other) if(state!=0) { 
			image_index = 0;	
			image_speed = 0;
		}
	}		
} }
