function hgBush() {
	
	if (tilemap_get(tileMap, ix, iy-1)=0 && tilemap_get(tileMap, ix, iy)>0) {
		//tilemap_set(tileMap, 1, ix, iy)
		instance_create_layer(ix*32+16,(iy)*32,layer,oHazBush)
		return(true)
	} else return(false)
}

function hgShooter() {
	var platWidth = 3+irandom(3)
	var buildDir = choose(-1,1)
	
	if(ix+3>xLimit) buildDir = -1
	if(ix-3<0) buildDir = 1
	
	instance_create_layer(ix*32+16,iy*32+32,layer,oPeaLad)
	if(tilemap_get(tileMap,ix,iy+1)=0) tilemap_set(tileMap, 1, ix, iy+1)
	
	var saveX = ix
	
	repeat(platWidth) {
		if(ix>=xLimit) break
		tilemap_set(tileMap, 0, ix, iy)
		ix+=buildDir
	}
	if(buildDir=-1) ix=saveX
	
	return(true)
}

function hgBushManRight() {
	
	if(ix+6>xLimit) return(false)
	
	var hInc = 1+irandom(2)
	var iterations = 9+random(6)
	
	tilemap_set(tileMap, 0, ix, iy)
	tilemap_set(tileMap, 0, ix, iy-1)
	tilemap_set(tileMap, 0, ix+1, iy-1)
	tilemap_set(tileMap, 2, ix, iy+1)
	
	var py = iy
	
	instance_create_layer(ix*32+16,iy*32+32,layer,oBushman)
	repeat(iterations) {
		if(ix>=xLimit) break
		
		if(hInc>0){
			ix++
			hInc--
		} else {
			py++
			hInc = 1+irandom(2)
		}
		tilemap_set(tileMap, 0, ix, py)
		tilemap_set(tileMap, 2, ix, py+1)
	}
	return(true)
}

function hgBushManLeft() {
	
	if(ix-6<0) return(false)
	
	var hInc = 1+irandom(2)
	var iterations = 9+random(6)
	
	tilemap_set(tileMap, 0, ix, iy)
	tilemap_set(tileMap, 0, ix, iy-1)
	tilemap_set(tileMap, 0, ix-1, iy-1)
	tilemap_set(tileMap, 2, ix, iy+1)
	
	var px = ix
	var py = iy
	
	var bush = instance_create_layer(ix*32+16,iy*32+32,layer,oBushman)
	bush.image_xscale = -1
	
	repeat(iterations) {
		if(px<0) break
		
		if(hInc>0){
			px--
			hInc--
		} else {
			py++
			hInc = 1+irandom(2)
		}
		tilemap_set(tileMap, 0, px, py)
		tilemap_set(tileMap, 2, px, py+1)
	}
	return(true)
}