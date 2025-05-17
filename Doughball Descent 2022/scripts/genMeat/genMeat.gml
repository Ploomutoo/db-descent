function hgMeatworm() {
	
	var tunnelDir = choose(1,-1)
	
	if(ix+6>xLimit) tunnelDir = -1
	if(ix-6<0) tunnelDir = 1
	
	var tunLength = 8+irandom(8)
	var tunV = 0
	
	tilemap_set(tileMap, 0, ix, iy)
	tilemap_set(tileMap, 0, ix, iy-1)
	tilemap_set(tileMap, 0, ix+1, iy-1)
	tilemap_set(tileMap, 0, ix, iy+1)
	
	var py = iy
	var px = ix
	
	var worm = instance_create_layer(ix*32+16,iy*32+16,layer,oMeatball)
	worm.hspeed = tunnelDir
	worm.vspeed = 0
	
	repeat(tunLength) {
		
		tunV = irandom(2)-1
		
		if(ix>=xLimit) break
		if(ix<=0) break
		
		if(tunV=0) {
			px+=tunnelDir	
		} else {
			py+=tunV
		}
		tilemap_set(tileMap, 0, px, py)
	}
	return(true)
}

function hgSauce() {
	var veinWidth = 1 + irandom(2) //Temporarily the width of gravel vein
	var i = irandom_range(1,2)
	
	var explosive = oHazHotSauce
	if(area = 5) explosive = oTNT
	
	while (veinWidth>0){
		while(i>0){
			var tmg = tilemap_get(tileMap,ix+veinWidth,iy+i)>0
			if(tmg>0 && tmg!=4) {
				instance_create_layer(32*(ix+veinWidth),32*(iy+i),layer,explosive)
				//instance_create_layer(32*(ix+veinWidth),32*(iy+i),layer,oThumbtack)
			}
			i--
		}
		i = 1 + irandom(2)
		veinWidth--
	}
	return(true)
}

function hgFish() {
	var workingIy = iy;
	var fishPlace = oFish;
	if(area=5) fishPlace = oTaiyaki;
	
	repeat(irandom_range(1,2+loop)) {
		instance_create_layer(32*ix,32*workingIy+8,layer,fishPlace)
		workingIy -= choose(1,2)
	}
	return(true)
}

#macro genSaw instance_create_layer(32*ix+17,32*iy+16,layer,oSaw)
function hgSaw() {
	if(iy<6) return(false)
	//if(tilemap_get_at_pixel(tileMap,ix*32+16,iy*32+16)=0) return(false)
	
	var saw
	var sawCount 
	var i = 0
	
	switch(irandom(6)){ 
		case 0: //2-4 Equidistant, Identical Saws
			
			sawCount = irandom_range(2,2+loop)
			
			repeat(sawCount) {
				
				saw[i] = genSaw
				saw[i].chainAngle = saw[0].chainAngle + i*360/sawCount
				saw[i].chainSpeed = saw[0].chainSpeed
				saw[i].chainLength = saw[0].chainLength
				i++
				
			}
			break;
		case 1: //1 Saw
		case 2:
		case 3:
			genSaw
			break;
	}
	tilemap_set(tileMap,2,ix,iy)
	return(true)
}

function hgHotdogCorridor() {
	
	if(iy<2) return(false)
	
	//Move IX back
	ix -= irandom_range(0,5);	if(ix<0) ix = 0
	var corrEnd = ix + irandom_range(4,8)
	if (corrEnd > xLimit) {
		ix -= corrEnd-xLimit
		corrEnd = xLimit
	}
	
	var randReplace = irandom_range(0,4)
	//Scroll IX across to corrEnd
	while(ix<=corrEnd){
		
		if((ix+iy)/randReplace%3 = 2) tilemap_set(tileMap, 6, ix, iy-3)
		
		tilemap_set(tileMap, 0, ix, iy-2)
		
		tilemap_set(tileMap, 0, ix, iy-1)
		
		if(randReplace=0) { tilemap_set(tileMap, 6, ix, iy); randReplace = irandom_range(2,4); instance_create_depth(32*ix,32*(iy-1),depth,oParagoomba)
		} else { tilemap_set(tileMap, 2, ix, iy); randReplace-- }
		
		ix++
	}
	
	return(true)
}