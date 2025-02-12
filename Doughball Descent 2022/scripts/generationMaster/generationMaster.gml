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

function hgSpikes() {
	
	if (tilemap_get(tileMap, ix, iy-1)=0 && tilemap_get(tileMap, ix, iy)>0) {
		repeat(irandom_range(1,4)){
			
			tilemap_set(tileMap, 3, ix, iy)
			tilemap_set(tileMap, 0, ix, iy-1)
			instance_create_layer(ix*32+16,(iy)*32,layer,oHazSpike)
			ix++
			
		}
		return(true)
	} else return(false)
}

function hgGravel() {
	var veinWidth = 1 + irandom(2) //Temporarily the width of gravel vein
	var i = 1 + irandom(2)
	while (veinWidth>0){
		while(i>0){
			var tmg = tilemap_get(tileMap,ix+veinWidth,iy+i)>0
			if(tmg>0 && tmg!=4) {
				instance_create_layer(32*(ix+veinWidth),32*(iy+i),layer,oHazGravel)
				//instance_create_layer(32*(ix+veinWidth),32*(iy+i),layer,oThumbtack)
			}
			i--
		}
		i = 1 + irandom(2)
		veinWidth--
	}
	return(true)
}

function hgBouncy() {
	var endVein = ix + 1 + irandom(4) //Temporarily the width of bouncy vein
	var i = 0;
	
	var tmg, tmgLast;
	
	while (ix<=endVein)
	{
		tmgLast = tilemap_get(tileMap,ix,iy+1)
		while(i>=-3)
		{
			
			tmg = tilemap_get(tileMap,ix,iy-(1+i))
			if(tmg=0 && tmgLast>0) {
				instance_create_layer(16+32*ix,32+32*(iy-i),layer,oHazBouncy)
				tilemap_set(tileMap,0,ix,iy-i)
				break;
			}
			tmgLast = tmg
			
			i--
		}
		i = 0
		ix++
	}
	return(true)
}