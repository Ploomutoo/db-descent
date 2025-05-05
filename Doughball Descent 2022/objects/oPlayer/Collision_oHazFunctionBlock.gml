if(vspeed>0 && crushes>0)  {
	
	if(instance_exists(other)) other.hitFunc(false,self)
	if(!other.collide) exit;
	
	crushes--
	if(jumpedTimer>0) vspeed = -6
	
	if(instance_exists(other)) crushes = 0
	else vspeed = -1
}