function hgInnit(argument1,argument2,argument3){
	///@arg resetMin
	///@arg resetMax
	///@arg function
	
	//Counter
	hGen[hgItems,0] = 0
	
	//Reset Min
	hGen[hgItems,1] = argument1*loopMultiplier
	//Reset Max
	hGen[hgItems,2] = argument2*loopMultiplier
	//Function to Execute
	hGen[hgItems,3] = argument3
	
	//Set Counter
	hGen[hgItems,0] = irandom_range(hGen[hgItems,1],hGen[hgItems,2])
	hgItems ++
}

function hgIncrement(argument0) {
	if(hGen[argument0,0]<=0){
		
		var executed = hGen[argument0,3]()
		if(executed) hGen[argument0,0] = irandom_range(hGen[argument0,1],hGen[argument0,2])
		
	} else hGen[argument0,0]--
}