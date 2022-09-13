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
		if(oPlayer.health<2) return([0]);
		else return([1,"Give 1 HP"]);
	},
		
	txSuccess : "Marvelous! Have a peasant\nfor your troubles",
	success : function(){
		takeDamage(1);
		oPlayer.evKatsuma = 1
		other.image_index = 1
		audio_play_sound(sndMirin,0,0)
		oCamera.screenShake = 4
	},
		
	txFailure : "Hmm, it seems you\nhaven't a morsel to spare. Come back with more dough\non your bones, serf",
	failure : function(){ },
	endFunc : function(){ }		
} }
