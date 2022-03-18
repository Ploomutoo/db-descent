paused = !paused
cursorOn = 0

if(autoPause>0) exit;

var terrainLayer = layer_get_id("terrain")
if(paused){ //pause
	
	instance_deactivate_all(true)
	if(terrainLayer!=-1) layer_set_visible("terrain",false)
	
} else { //unpause
	
	instance_activate_all()
	if(terrainLayer!=-1) layer_set_visible("terrain",true)
		
	for(var i = 0; i<ds_list_size(deactList); i++){
		
		//show_debug_message("Running deactivation loop " + object_get_name(deactList[|i].object_index))
		if(instance_exists(deactList[|i])) {
			
			instance_deactivate_object(deactList[|i]) 
			
		} else {
			
			show_debug_message("No object detected")
			ds_list_delete(deactList,i);
			i--;
		}
	}
}