function eventRest(){
event = {
		
	sprite: sEvRest,
	eName : "Rest Site",
	txExposition : "The air is warm around the cozy campfire. "
	+"A comfy yule log lays nearby. Perhaps a rest is in order",
	txAttempt : "You rest your weary body upon the log",
	txDecline : "You are in no mood to rest/nThere is adventuring to be done",
		
	eChance : function(){
		return([1,"Heal to Full"]);
	},
		
	txSuccess : "It feels nice to take a load off\nYour will is restored",
	success : function(){
		
		soundRand(sndSafe)
		with(oPlayer) {
			if(hearts<heartMax) hearts = heartMax;
			else soulHearts+=2;
		}
	},
		
	//txFailure : "what", //this should not happen
	//failure : function(){},
	endFunc : function(){
		with(other) {
				
			image_index = 0
			image_speed = 0
		}
	}		
} }
