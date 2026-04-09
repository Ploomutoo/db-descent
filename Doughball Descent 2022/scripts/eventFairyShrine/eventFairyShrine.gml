function eventFairyShrine(){
event = {
		
	sprite: sEvFairyShrine,
	eName : "Fairy Shrine",
	txExposition : "A bat is perched on a strange outgrowth. "
	+"It chitters faintly, something about blood?",
	txAttempt : "You offer your blood to the bat. It drinks greedily!",
	txDecline : "You'd prefer to  hang onto your blood, actually",
		
	eChance : function(){
		if(oPlayer.hearts<2) return([0,"No HP"]);
		else return([1,"Give Blood"]);
	},
		
	txSuccess : "The bat smiles contentedly,\npresenting you with a gift!",
	success : function(){
		image_index = 1
		soundRand(sndBloodlust)
		with(oPlayer)
		{
			var heartsSpent = hearts-1
			while(heartsSpent > 0)
			{
				if(heartsSpent >= 3)
				{
					instance_create_layer(x+32+floor(heartsSpent/3)*48,y,layer,oItemPedestal);
					heartsSpent-=3
				}
				else
				{
					heartsSpent-=1
					weight += 25
					popUp(x,y-48-8*heartsSpent,"+25")
				}
			}
			hearts = 1
			instance_create_layer(x+80,y,layer,oItemPedestal);
		}
	},
		
	txFailure : "But you didn't have enough blood to give",
	failure : function(){
		with(oPlayer){

		}
	},
	endFunc : function(){
		with(other) 
		{
			image_speed = 0
		}
	}		
}}