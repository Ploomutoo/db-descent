/// @description pause
if(paused || toggledThisFrame) exit;
//if(instance_exists(oTitle)) exit;

paused = true
cursorOn = 0
if(autoPause>0) exit;

var terrainLayer = layer_get_id("terrain")
var backgroundLayer = layer_get_id("laBackground")

instance_deactivate_all(true)
if(terrainLayer!=-1) layer_set_visible("terrain",false)
if(backgroundLayer!=-1) layer_set_visible(backgroundLayer,true)

toggledThisFrame = true;