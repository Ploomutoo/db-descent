if(weight>=100) crushes = 1
else crushes = 0

roomGrav = -1;

if(endHeight=-1) endHeight = room_height+32

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

//sidebar shit

drawProg=0
mapHeight = round(room_height/32)

tileMap = layer_tilemap_get_id("terrain")

if(room = rGame) {
	//audio_stop_sound(musTransition)
	iwGravitate()
	level++	
	show_debug_message("level++")
	if(level>lastLevel-1){
		level = 0
		loop++
	}
} else if(room = rChoice) {
	
	calibrateGameHeight
	
	if((level) mod 3 = 0) playMusic(musTransition)
	//alarm[0] = 30
}