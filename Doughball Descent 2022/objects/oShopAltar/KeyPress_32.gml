if(playerOn && price>0) {
	if(oPlayer.weight>=price && oPlayer.weight>50){
		oPlayer.weight-=price
		if(oPlayer.weight<50) oPlayer.weight = 50
		
		soundRand(sndAltarUse)
		incAltarVar(altarType)
	}
}
event_user(1)