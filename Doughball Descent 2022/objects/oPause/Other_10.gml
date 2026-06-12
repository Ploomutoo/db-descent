/// @description pause
if(paused || toggledThisFrame) exit;
//if(instance_exists(oTitle)) exit;

paused = true
cursorOn = 0
playerObj = instance_find(oPlayer,0)
itemCursorOn = 0
//if(player = noone) show_debug_message("No player found")
if(autoPause>0) exit;

var terrainLayer = layer_get_id("terrain")
var backgroundLayer = layer_get_id("laBackground")

instance_deactivate_all(true)
if(terrainLayer!=-1) layer_set_visible("terrain",false)
if(backgroundLayer!=-1) layer_set_visible(backgroundLayer,true)

toggledThisFrame = true;