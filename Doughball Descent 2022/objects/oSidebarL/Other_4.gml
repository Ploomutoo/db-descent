#macro calibrateGameHeight room_set_height(rGame,2048+level*512+loop*1024)

tileMap = layer_tilemap_get_id("terrain")

if(room = rGame) {
	//audio_stop_sound(musTransition)
	iwGravitate()
	level++	
	if(level>lastLevel-1){
		level = 0
		loop++
	}
} else if(room = rChoice) {
	
	calibrateGameHeight
	
	if((level) mod 3 = 0) playMusic(musTransition)
	//alarm[0] = 30
}