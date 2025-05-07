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

function tileClear(tx,ty) {
	if(tilemap_get(tileMap,tx,ty) = 4) {
		
		var tObj = instance_position(tx*32+16,ty*32+16,oParentTileObject)
		if(instance_exists(tObj)) {
			tObj.onDestroy = false;
			instance_destroy(tObj);
		}
		else show_debug_message("function tile but no object?")
	}	
	tilemap_set(tileMap, 0, tx, ty)
}

function hgAxe() {
	//if(tilemap_get_at_pixel(tileMap,ix*32+16,iy*32+16)=0) return(false)
	if(ix<3 || iy<3) return(false);
	
	var i = 0;
	var i2 = 0;
	var boxSize = choose(3,5,7);
	while(boxSize>ix) boxSize-=2;
	
	while(i2<4) {
		switch(i2) {
			case 0:
				ix--;
			break;
			case 1:
				iy--;
			break;
			case 2:
				ix++;
			break;
			case 3:
				iy++;
			break;
		}
		tileClear(ix,iy);
		i++;
		if(i=boxSize) {
		 i = 1;
		 i2++;
		}
	}
	i = ix-floor(boxSize/2);
	i2 = iy-floor(boxSize/2);
	tileClear(i,i2);
	tilemap_set(tileMap,3,i,i2);
	with(instance_create_layer(32*i+16,32*i2+16,layer,oSawAlt)){
		chainLength = floor(boxSize/2);
		chainSpeed = 1+random(3);
	}
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

function hgDragon() {
	if(!instance_exists(oDragon)) instance_create_depth(0,0,0,oDragon)
	return(true);
}
