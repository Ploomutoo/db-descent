if(weight>=100) crushes = 1
else crushes = 0

if(!instance_exists(oTextBox)) instance_create_layer(0,0,layer,oTextBox)

if(room = rGame){
	
	#region Spawn Platform
		var tPlace = 1
		if(level = 0) {
			tilemap_set_at_pixel(tileMap,tPlace,x-16,128)
			tilemap_set_at_pixel(tileMap,tPlace,x+16,128)
	
			tilemap_set_at_pixel(tileMap,tPlace,x-48,128)
			tilemap_set_at_pixel(tileMap,tPlace,x+48,128)
	
			tilemap_set_at_pixel(tileMap,tPlace,x-16,166)
			tilemap_set_at_pixel(tileMap,tPlace,x+16,166)
		} else {
			tilemap_set_at_pixel(tileMap,tPlace,x-16,128)
			tilemap_set_at_pixel(tileMap,tPlace,x+16,128)
		}
	#endregion
}