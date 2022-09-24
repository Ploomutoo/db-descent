// sauce joke

function rareEvBlompo(){
event = {
		
	sprite: srEvBlompo,
	eName : "Blompo Appears",
	eVoice: talkBlompo,
	txExposition : "You there, dough-cat-thing!. "
	+"You haven't seen a gala, have you?\nOf the resplendent variety?. "
	+"Pah, it's hungry work looking for galas\nI'm positively famished!.  "
	+"You're edible, right?",
	txAttempt : "Ohoho! Do you prefer\ndinner fork or dessert fork?",
	txDecline : "Begone then, do not waste my blood sugar\nwith your incessant hobnobbery",
		
	eChance : function(){
		if(oPlayer.hearts<2) return([0,"Not Enough HP"]);
		else return([1,"Give 1 HP"]);
	},
		
	txSuccess : "Marvelous! Have a peasant\nfor your troubles",
	success : function(){
		
		other.image_index = 0
		other.image_speed = 0
		
		minionAdd(other.x,other.y);
		with (oPlayer) takeDamage(1);
	},
		
	txFailure : "Hmm, it seems you\nhaven't a morsel to spare. Come back with more dough\non your bones, serf",
	failure : function(){ },
	endFunc : function(){ }		
} }
