if(playerOn && price>0 && oPlayer.mobile) {
	if(oPlayer.weight>=price && oPlayer.weight>50){
		oPlayer.weight-=price
		if(oPlayer.weight<50) oPlayer.weight = 50
		
		soundRand(sndAltarUse)
		incAltarVar(altarType)
	}
}
event_user(1)