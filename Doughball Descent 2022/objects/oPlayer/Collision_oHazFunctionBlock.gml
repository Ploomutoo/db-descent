if(vspeed>0 && crushes>0)  {
	crushes--
	if(jumpedTimer>0) vspeed = -6
	
	with(other) event_user(0)
	
	if(instance_exists(other)) crushes = 0
	else vspeed = -1
}