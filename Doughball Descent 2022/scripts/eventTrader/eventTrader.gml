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
		} else {
			txExposition = txExposition + "Perhaps you are too, is that\n a "+eItem.nameTag+" betwixt your folds?. "
			+"I simply must have it,\nfor a fair price!"
		}		
	},
	eChance : function(){
		if(eItem = noone) return([0,"No Items"]);
		else return([1,"Trade all "+eItem.nameTag+" Stacks"]);
	},
		
	txSuccess : "Fefefe!",
	success : function(){
		
		other.image_index = 0
		other.image_speed = 0
		
		
	},
		
	txFailure : "Hmm, it seems you\nhaven't a morsel to spare. Come back with more dough\non your bones, serf",
	failure : function(){ },
	endFunc : function(){ }		
} }