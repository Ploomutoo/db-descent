function hgGumballMan() {
	
	//show_debug_message("Running Gumball Gen")
	
	var buildDir = choose(-1,1)
	
	if(ix+6>xLimit) buildDir = -1
	if(ix-6<0) buildDir = 1
	
	var hInc = 1+irandom(2)
	var iterations = 9+random(6)
	
	tilemap_set(tileMap, 0, ix, iy)
	tilemap_set(tileMap, 0, ix, iy-1)
	tilemap_set(tileMap, 0, ix+buildDir, iy-1)
	
	tilemap_set(tileMap, 2, ix, iy+1)
	
	var py = iy
	
	var bush = instance_create_layer(ix*32+buildDir*16,iy*32+32,layer,oGumballer)
	bush.image_xscale = buildDir
	
	repeat(iterations) {
		
		if(ix>=xLimit || ix<0) break
		
		if(hInc>0){
			ix+=buildDir
			hInc--
		} else {
			py++
			hInc = 1+irandom(2)
		}
		tilemap_set(tileMap, 0, ix, py)
		tilemap_set(tileMap, 0, ix+buildDir, py)
		tilemap_set(tileMap, 2, ix, py+1)
		
	}
	return(true)
}

function fillLine(left,right,line,tile) {
	for(var i = left; i<=right; i++){
		tilemap_set(tileMap, tile, i, line)
	}
}
function hgGummyWorm() {
	
	var xLeft = ix;
	var xRight = xLeft+irandom_range(4,6);
	
	if(xLeft>xLimit){
		if(xLeft-xLimit>6) xLeft = xLimit;
		else return(false);
	}
	if(yLimit-y<8) return(false);
	
	//Expanding Layer
	repeat(irandom_range(2,4)){
		xLeft-=choose(0,0,1,1,2); xLeft = max(0,xLeft);
		xRight+=choose(0,0,1,1,2); xRight = min(xRight,xLimit);
		
		fillLine(xLeft,xRight,iy,0);
		iy++;
		
	}
	//Middle Layer
	for(ix = xLeft; ix<=xRight; ix++){
		var placeTile = choose(0,0,1,2);
		tilemap_set(tileMap, placeTile, ix, iy)
		if(placeTile = 2) instance_create_depth(32*ix,32*iy,0,oGummyWorm)
	}
	iy++;
	
	//Shrinking layer
	repeat(irandom_range(2,4)){
		xLeft+=choose(0,0,1,1,2); xLeft = min(xLeft,xLimit);
		xRight-=choose(0,0,1,1,2); xRight = max(0,xRight);
		
		fillLine(xLeft,xRight,iy,0);
		iy++;
		
	}
	ix = xRight+3;
	iy-= irandom(3);
	return(true);
}

function hgAxe() {
	if(tilemap_get_at_pixel(tileMap,ix*32+16,iy*32+16)=0) return(false)
	
	instance_create_layer(32*ix+16,32*iy+16,layer,oSawAlt)	
	return(true);
}
	
function hgEclair() {
	var eclairSpot = irandom(xLimit-1);
	var placeTile;
	for(ix = 0; ix<xLimit; ix++){
		tilemap_set(tileMap, 0, ix, iy)
		
		if(ix = eclairSpot) {
			placeTile = 2;
			instance_create_depth(ix*32+16,iy*32+32,0,oEclair);
		} else placeTile = choose(0,1,2);
		
		tilemap_set(tileMap, placeTile, ix, iy+1)
	}
	return(true);
}