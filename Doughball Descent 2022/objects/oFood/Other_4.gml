var conflict = instance_position(x,y,oFood)

if(conflict!=noone && conflict != id) {
	//show_debug_message("Overlapping Food")
	
	if(conflict.image_index>image_index) instance_destroy()
	else instance_destroy(conflict)
}