/// @description unpause
if(!paused || toggledThisFrame) exit;

paused = false
cursorOn = 0

var terrainLayer = layer_get_id("terrain")
var backgroundLayer = layer_get_id("laBackground")
if(mode="toplevel")
{
	
	//unpause
	instance_activate_all()
	if(terrainLayer!=-1) layer_set_visible("terrain",true)
	if(backgroundLayer!=-1) layer_set_visible(backgroundLayer,false)
	
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

toggledThisFrame = true;