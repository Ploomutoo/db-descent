function rareEvZev(){
event = {
		
	sprite: srEvZev,
	eName : "Zev Statue",
	txExposition : "A horned figure is hewn roughly from a boulder here. "
	+"Its hand is outreached,\nas though expecting an offering. "
	+"Do you offer something to the statue?",
	txAttempt : "You offer a part of yourself to the stone",
	txDecline : "You decide against it",
		
	eChance : function(){
		if(oPlayer.heartMax<3) return([0,"Not Enough Max HP"]);
		else return([1,"Give 1 Max HP"]);
	},
		
	txSuccess : "A strange energy surges through you. "
	+"You feel oddly attuned to the stones around you,\nand rather hungry",
	success : function(){
		
		other.image_index = 1		

		addItem(osZev)
		oPlayer.heartMax -= 2;
		
		soundRand(sndHurt);
		oCamera.screenShake = 4
		
		freezeFrame(3);
	},
		
	txFailure : "But you have nothing to give",
	failure : function(){ },
	endFunc : function(){ }		
}

}