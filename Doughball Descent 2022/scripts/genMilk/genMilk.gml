function hgUdder() {
	var platWidth = 3+irandom(3)
	
	instance_create_layer(ix*32+16,(iy+1)*32,layer,oUdder)
	repeat(platWidth) {
		if(ix>=xLimit) break
		tilemap_set(tileMap, 0, ix, iy)
		tilemap_set(tileMap, 2, ix, iy-1)
		ix++
	}
	return(true)
}

function hgMilkfall() {
	instance_create_layer(ix*32,iy*32,layer,oMilkFall)
	return(true)
}

function hgMilkSpiller() {
	
	var shaftHeight = irandom_range(2,4)
	instance_create_layer(ix*32,(iy-shaftHeight)*32,layer,oMilkSpiller)
	
	while(shaftHeight>0) {
		shaftHeight--
		tilemap_set(tileMap, 0, ix, iy-shaftHeight)
	}
	return(true)
}

function hgPirate() {
	var lay = layer_get_id("instanceBack")
	instance_create_layer(0,iy*32,lay,oMilkBg)
	instance_create_layer(room_width/2,iy*32,lay,oPirate)
	return(true)
}