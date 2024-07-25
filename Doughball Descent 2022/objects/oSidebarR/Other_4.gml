 if(instance_number(object_index)>1) show_debug_message("many")
drawProg=0
mapHeight = round(room_height/32)

//From SidebarL

#macro calibrateGameHeight room_set_height(rGame,2048+level*512+loop*1024)

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