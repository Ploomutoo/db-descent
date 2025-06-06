function eventAdventurer(){
event = {
	
	//Success is failure (You need to feed him more)
	//Failure is success (You get an item)
	
	sprite: sEvAdventurer,
	eName : "Adventurer",
	txExposition : "Hark! Traveler.  "
	+"I've grown peckish in my travels,\nwould you spare me some of your ample reserves? ",
	txAttempt : "You give the traveler a portion of your supplies",
	txDecline : "Ah,  very well. I won't badger you further then",
	cost : 25+floor(level/3)*5,
	
	eChance : function(){
		var i = [0.8,"Donate "+string(cost)+" lbs"];
		if oPlayer.weight<100+cost i = [-1,"Not enough to give!"]
		return(i);
	},
		
	txSuccess : "Delectable, thank you!.  "+
	+"I don't suppose you have any more?",
	success : function(){
		var nutrition = cost;
		with(oPlayer) 
		{
			weight-=nutrition;
			popUp(x,y-48,"-"+string(nutrition))
		}
		
		if (oPlayer.weight<101+cost)
		{
			oTextBox.announce(0,"It seems you have no more to give!")
			endFunc();
		}
		else with(other) {
			state = 0;
			drawChance = floor(event.eChance()[0]*100);
			drawText = "Give more?";
		}
	},
		
	txFailure : "Thank you! Please, allow me to repay your generosity",
	failure : function(){
		var nutrition = cost;
		with(oPlayer)
		{
			weight-=nutrition;
			popUp(x,y-48,"-"+string(nutrition))
		}
		with(other) instance_create_layer(x+64,y,layer_get_id("instances"),oItemPedestal);
	},
	endFunc : function(){
		with(other) if(state=-1) { 
			sprite_index = sEvAdventurerEnd;
			image_index = 0;	
		}
	}		
} }
