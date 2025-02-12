function hgGoomba() {
	var platWidth = 3+irandom(3)
	
	instance_create_layer(ix*32+16,iy*32+32,layer,oGoombaEmpty)
	repeat(platWidth) {
		if(ix>=xLimit) break
		tilemap_set(tileMap, 0, ix, iy)
		tilemap_set(tileMap, 2, ix, iy+1)
		ix++
	}
	return(true)
}
	
function hgBagel() {
	var platWidth = 5+irandom(3)
	if(ix+platWidth/2>xLimit) return(false)
	
	if(area=5 || ( loop>0 && random(1)>1/(loop+1) )) instance_create_depth((ix+2)*32,iy*32+16,depth,oDonut)
	else instance_create_depth((ix+platWidth/2)*32,iy*32+16,depth,oBagel)
	
	if(area=5) { 
		if(ix<1) instance_create_depth(32,iy*32+32,depth,oHazSpikeHor)
		else instance_create_depth(ix*32,iy*32+32,depth,oHazSpikeHor)
	}

	repeat(platWidth) {
		
		if(ix>=xLimit) {
			if(area=5) { var spike = instance_create_depth(ix*32-64,iy*32+32,depth,oHazSpikeHor); spike.facing = -1; }
			return(true);
		}
		tilemap_set(tileMap, 0, ix, iy);
		ix++;
		
	}
	
	if(area=5) { var spike = instance_create_depth(ix*32-32,iy*32+32,depth,oHazSpikeHor); spike.facing = -1; }
	return(true);
}

function hgBigWorm() {
	var platWidth = 3+irandom(3)
	
	instance_create_layer(ix*32+16,iy*32+32,layer,oBigWorm)
	repeat(platWidth) {
		if(ix>=xLimit) ix = 0
		tilemap_set(tileMap, 0, ix, iy)
		tilemap_set(tileMap, 0, ix, iy-1)
		tilemap_set(tileMap, 2, ix, iy+1)
		ix++
	}
	return(true)
}

function hgRay() {
	var platWidth = 3+irandom(5)
	
	instance_create_layer(ix*32+16,iy*32+16,layer,oRay)
	repeat(platWidth) {
		if(ix>=xLimit) break
		tilemap_set(tileMap, 0, ix, iy)
		tilemap_set(tileMap, 0, ix, iy-1)
		ix++
	}
	return(true)
}