if(cDownHeld) exit;

if(y<other.y-4 && vspeed>=0) 
{	
	vspeed = -20
	loGrav(0.1,0.5)
	
	with(other) hitFunc(false,self)
}