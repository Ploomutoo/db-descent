function pickInvItem(){
	return(instance_find(oBase, irandom(instance_number(oBase)-1) ) )
}

function eventTrader(){
event = {
		
	sprite: sEvTrader,
	eName : "Collector",
	eVoice: talkCollector,
	eItem : noone,
	txExposition : "Fefefe, greetings traveler. "
	+"I am a collector of the\nvarious curios of the Zigguraut. ",
	txAttempt : "No refunds!",
	txDecline : "Hmph, very well. I have no doubt it will find\nme again in due time, fefefe",
	
	eInit : function() {
		eItem = pickInvItem();
		if(eItem = noone) {
			txExposition = txExposition + "Come by again if you\nfind anything interesting"
			txFailure = "You don't have anything"
		} else {
			txExposition = txExposition + "Perhaps you are too, is that\n a "+eItem.nameTag+" betwixt your folds?. "
			+"I simply must have it,\nfor a fair price!"
			txFailure = "You don't have a "+eItem.nameTag;
		}		
	},
	eChance : function(){
		
		if(eItem = noone || !instance_exists(eItem)) return([0,"No Items"]);
		else return([1,"Trade all "+eItem.nameTag+" Stacks"]);
	},
		
	txSuccess : "Fefefe!",
	success : function()
	{
		var iStacks = eItem.stacks
		//show_debug_message("Obj is "+string(eItem)+"\nID is "+string(eItem.id))
		
		with(eItem)
		{
			show_debug_message("Self is "+string(self))
			removeItem(self);
		}
		
		var newItem = addItem(pickItem());
		with(newItem) {
			
			stacks += iStacks;
			event_user(0);	
			
			popUp(oPlayer.x,oPlayer.y-48,"Got "+string(stacks)+" "+nameTag+"s!")
		}
		//show_debug_message(string(oPlayer.items))
	},
		
	txFailure : "Error",
	failure : function(){ },
	endFunc : function()
	{ 		
		other.image_index = 0
		other.image_speed = 0
	}		
} }