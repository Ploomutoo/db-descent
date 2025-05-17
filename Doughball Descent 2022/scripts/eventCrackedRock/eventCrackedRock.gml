function eventCrackedRock(){
event = {
		
	sprite: sEvBoulder,
	eName : "Cracked Stone",
	txExposition : "A towering boulder stands before you. "
	+"Its smooth surface is marred by a conspicuous crack. "
	+"With enough force you could probably crack it open",
	txAttempt : "You take a sturdy stance and brace to break the stone open",
	txDecline : "You reconsider, your padding seeming\ninadequate for something so drastic",
		
	eChance : function(){
		var i = 1-100/(oPlayer.weight+50)
		i = [clamp(i,evMinChance,1)]
		return(i);
	},
		
	txSuccess : "You strike the boulder with your entire\nweight shattering it to pieces",
	success : function(){
		with(oPlayer) instance_create_layer(x,y,layer,oItemPedestal);
	},
		
	txFailure : "You bounce off of the boulder\nits surface unscathed. You, however are bruised\nslightly by the effort",
	failure : function(){
		with(oPlayer){
				
			takeDamage(1);
			popUp(x,y-48,"OW")
		}
	},
	endFunc : function(){
		with(other) {
				
			image_index = 0
			image_speed = 0
		}
	}		
} }
