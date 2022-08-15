var overlap = instance_position(x+16,y+16,oParentTileObject)

if(overlap !=noone && overlap != id){
	overlap.onDestroy = false
	instance_destroy(overlap)
}