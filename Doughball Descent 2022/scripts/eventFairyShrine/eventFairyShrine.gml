function eventFairyShrine(){
event = {
		
	sprite: sEvFairyShrine,
	eName : "Fairy Shrine",
	txExposition : "Fairies flitter around an old shrine. It is customary to leave such shrines\nan offering",
	txAttempt : "You place some food at the base of the shrine",
	txDecline : "You clutch your supplies greedily, hungrily",
	eChance : function(){
		if(oPlayer.weight<125) return([0,"No Food"]);
		else return([1,"Give Food"]);
	},
	txSuccess : "A fairy flutters lazily to your side,\njoining you on your journey",
	success : function(){
		with(oPlayer)
		{
			weight-=25
			instance_create_layer(x,y,layer,oFairy)
		}
	},
	txFailure : "But you didn't have enough food to give",
	failure : function(){},
	endFunc : function(){
		with(other) 
		{
			image_speed = 0
		}
	},	
	eInit : function() {
		if(instance_exists(oFairy))
		{
			txExposition = "Your fairy friend flutters over to the shrine. With a shimmering light, a gift is left for you!" 
			
			eChance = function() {
				instance_destroy(oFairy)
				spawnItemAtPlayer()
				with(other)
				{		
					image_speed = 0
					state = 4
					oTextBox.storedText = ""
					event_user(0)
					state = -2
				}
				return([-1])
			}
		}
	}
}}