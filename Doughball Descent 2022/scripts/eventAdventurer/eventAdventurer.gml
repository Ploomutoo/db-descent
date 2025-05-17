function eventAdventurer(){
event = {
	
	//Success is getting the berries and refreshing the event
	//Failure is ending the event and taking (non-lethal) damage
	
	sprite: sEvAdventurer,
	eName : "Adventurer",
	txExposition : "Hark! Traveler.  "
	+"I've grown peckish in my travels,\nwould you spare me some of your ample reserves? ",
	txAttempt : "You give the traveler a portion of your supplies",
	txDecline : "Ah,  very well. I won't badger you further then",
		
	eChance : function(){
		var i = [random_range(0.3,0.8)];
		return(i);
	},
		
	txSuccess : "Delectable, thank you!.  "+
	+"I don't suppose you have any more?",
	success : function(){
		
		soundRand(sndFood);
		with(oPlayer) {
			
			var nutrition = 50+level*10;
			weight+=nutrition;
			popUp(x,y-48,"+"+string(nutrition))
		}
		with(other) {
			state = 0;
			drawChance = floor(event.eChance()[0]*100);
			drawText = string(drawChance)+"%";
		}
	},
		
	txFailure : "You are met with a faceful of thorns. When you emerge, the berries have vanished!",
	failure : function(){
		with(oPlayer){
				
			takeDamage(1);
			soundRand(sndPoke)
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
