var overlap = instance_position(x,y,oHazBush)

if(overlap != id && overlap !=noone){
	
	if(overlap.image_index = 1) image_index = 1
	
	overlap.onDestroy = false
	instance_destroy(overlap)
	
}