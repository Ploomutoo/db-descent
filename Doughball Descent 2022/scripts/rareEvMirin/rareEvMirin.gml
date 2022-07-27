function rareEvMirin(){
event = {
		
	sprite: srEvMirin,
	eName : "Tight Cave",
	txExposition : "A dubious creature stands before you\noffering you its blessing",
	txAttempt : "You gingerly accept the creature's offering",
	txDecline : "You decide not to entertain\nthe creature's offerings",
		
	eChance : function(){
		return(1);
	},
		
	txSuccess : "A strange energy fills your doughy body",
	success : function(){
		oPlayer.evVal[0] = 1
		other.image_index = 1
		audio_play_sound(sndMirin,0,0)
		oCamera.screenShake = 4
	},
		
	txFailure : "Within moments you have firmly\nwedged yourself in the opening. You are left solely with\ntime to reflect and digest",
	failure : function(){
		with(oPlayer){
				
			weight = max(weight-100,50)
			popUp(x,y-48,"-100 LBS")
		}
	},
	endFunc : function(){ }		
} }
