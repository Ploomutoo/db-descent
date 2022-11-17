event_inherited();

function foodGet(cal) {
	
	if(oPlayer.weight>maxWeight) {
		
		maxWeight = oPlayer.weight;
		maxWeight = min(maxWeight,500*stacks)
		return(cal);
	}
	
	var multiplier = 1+0.01*sqrt(maxWeight-oPlayer.weight);
	//show_debug_message(string(stacks)+" stacks of rebound\nmax weight of "+string(maxWeight)+". multiplier of "+string(multiplier));
	
	flash = 10;
	return(cal*multiplier);

}
