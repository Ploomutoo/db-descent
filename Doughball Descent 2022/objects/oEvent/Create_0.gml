depth+=4

state = 0
dx = dispWidth/2
dy = 32
dim = 0

//tilemap_tileset(tileMap,tsGeneric)
//show_debug_message(string(evScript));
if(evScript = noone) {
	
	if(isRare) pickEventRare();
	else pickEvent();
	
} else evScript();

if(variable_instance_exists(event,"eInit")) event.eInit();

voice = talkEvent;
if(variable_instance_exists(event,"eVoice")) voice = event.eVoice;

sprite_index = event.sprite;
//var cOut = 0.5