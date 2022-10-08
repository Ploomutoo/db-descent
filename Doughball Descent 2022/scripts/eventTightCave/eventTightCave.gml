function eventTightCave(){
event = {
		
	sprite: sEvCave,
	eName : "Tight Cave",
	txExposition : "A glimmer in the dark catches your eye. "
	+"The cave passage is narrow\nbut maybe, just maybe?. "
	+"Do you attempt to squeeze in?",
	txAttempt : "You suck in your belly and\nsmoosh yourself into the cave",
	txDecline : "You look yourself up and down. Maybe you would've fit a\nfew floating cheeseburgers ago",
		
	eChance : function(){
		var i = 150/oPlayer.weight
		i = [clamp(i,evMinChance,1)]
		return(i);
	},
		
	txSuccess : "Miraculously your pliable body oozes\nthrough the passage with ease. The item within is yours!",
	success : function(){
		with(oPlayer) instance_create_layer(x+80,y,layer,oItemPedestal);
	},
		
	txFailure : "Within moments you have firmly\nwedged yourself in the opening. You are left solely with\ntime to reflect and digest",
	failure : function(){
		with(oPlayer){
				
			weight = max(weight-100,50)
			popUp(x,y-48,"-100 LBS")
		}
	},
	endFunc : function(){
		with(other) {
				
			image_index = 0
			image_speed = 0
		}
	}		
} }
