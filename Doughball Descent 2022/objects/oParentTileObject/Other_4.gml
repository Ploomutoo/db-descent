var overlap = instance_position(x,y,oParentTileObject)
if(overlap != id && overlap !=noone){
	overlap.onDestroy = false
	instance_destroy(overlap)
}