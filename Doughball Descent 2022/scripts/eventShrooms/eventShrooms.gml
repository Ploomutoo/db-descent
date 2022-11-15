function eventShrooms(){
event = {
		
	sprite: sEvShrooms,
	eName : "Weird Mushrooms",
	eVoice: talkMushroom,
	eItem : noone,
	txExposition : "The air is thick with colorful spores. "
	+"You are overcome with a strange hunger. ",
	txAttempt : "You shrug and stuff\nthe item in your mouth",
	txDecline : "You resist the influence of the spores",
	
	eInit : function() {
		eItem = pickInvItem();
		if(eItem = noone) {
			txFailure = "If only you had something to eat"
		} else {
			txExposition = txExposition + "Your "+eItem.nameTag+" suddenly seems quite tasty";
			txFailure = "But you don't have a "+eItem.nameTag;
		}		
	},
	eChance : function(){
		
		if(eItem = noone || !instance_exists(eItem)) return([0,"No Items"]);
		else return([1,"Eat your "+eItem.nameTag]);
	},
		
	txSuccess : "Gulp! Not bad!",
	success : function()
	{	
		var nutrition = priceScale(eItem.price);
		with(oPlayer) 
		{
			weight+=nutrition;
			popUp(x,y-48,"+"+string(nutrition))
			soundRand(sndFood);
		
			hearts = oPlayer.heartMax;
			soundRand(sndHeart);
		}	
		with(eItem)
		{	
			if(stacks>1) stacks--;
			else removeItem(self);
		}
	},
		
	txFailure : "Error",
	failure : function(){ },
	endFunc : function()
	{ 		
		other.sprite_index = sEvShrooms2;
	}		
} }