/// @description Autopause Invoked
if(paused) exit;

//show_debug_message("autoPause " + string(autoPause))
instance_deactivate_all(true)
if(layer_get_id("terrain")!=-1) layer_set_visible("terrain",false)

