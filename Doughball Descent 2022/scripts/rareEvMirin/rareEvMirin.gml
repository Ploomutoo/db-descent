// sauce joke

function rareEvMirin(){
event = {
		
	sprite: srEvMirin,
	eName : "Katsuma Appears",
	txExposition : "A dubious creature stands before you\noffering you its blessing",
	txAttempt : "You gingerly accept the creature's offering",
	txDecline : "You decide not to entertain\nthe creature's offerings",
		
	eChance : function(){
		if(oPlayer.evVal[0]=1) return([0]);
		else return([1,"Receive Alternate Bash"]);
	},
		
	txSuccess : "A strange energy fills your doughy body",
	success : function(){
		oPlayer.evVal[0] = 1
		other.image_index = 1
		audio_play_sound(sndMirin,0,0)
		oCamera.screenShake = 4
	},
		
	txFailure : "But you are already imbued\nwith the creature's power",
	failure : function(){ },
	endFunc : function(){ }		
} }
