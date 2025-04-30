if (!ds_list_empty(poolInactive))
{
	var child = poolInactive[| 0]
	
	child.active = true;
	child.wobble = 90*irandom(4)
	child.image_index = 0
	child.y = oCamera.y-viewHeight/2
	child.x = oPlayer.x+irandom_range(-200,200)
	
	ds_list_delete(poolInactive,0)
}

alarm[0] = 30+irandom(room_speed*4)