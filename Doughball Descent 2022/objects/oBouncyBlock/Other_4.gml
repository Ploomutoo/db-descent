var overlap = instance_position(x,y,oParentTileObject)

if(overlap !=noone && overlap != id){
	overlap.onDestroy = false
	instance_destroy(overlap)
}