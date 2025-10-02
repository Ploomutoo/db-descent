function onCamera(_x){
	var cam = instance_find(oCamera,0)
	if(cam = noone) return(false)
	if( (_x>cam.c1leftbounds && _x<cam.c1rightbounds) || (_x>cam.c2leftbounds && _x<cam.c2rightbounds) )
	{
		return(true)	
	}
	else return(false)
}