event_inherited();

with(oPlayer){
	if(pKneesBonus=0){
		pKneesBonus=1
	} else pKneesBonus+=1*0.8^pKneesBonus
}