var overlap = instance_position(x,y,oParentTileObject)

if(overlap !=noone && overlap != id){
	overlap.onDestroy = false
	instance_destroy(overlap)
}

if(y+32>room_height)
{
	onDestroy = false
	instance_destroy()
}