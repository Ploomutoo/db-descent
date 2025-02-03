/// @description Autopause Invoked
if(paused) exit;

instance_deactivate_all(true)
if(layer_get_id("terrain")!=-1) layer_set_visible("terrain",false)

