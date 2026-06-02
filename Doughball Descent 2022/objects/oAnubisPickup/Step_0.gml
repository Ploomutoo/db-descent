switch(state)
{
	case "Idle":
	sinCounter+=3
	if(sinCounter>=360) sinCounter-=360
	y = baseY + dsin(sinCounter)*4
	
	if(collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,0)!=noone)
	{
		state = "Collected"
		sprite_index = sAnubisParticle
		soundRand(sndChimes)
	}
	break;
	
	case "Collected":
	if(!instance_exists(anubisInstance)) 
	{
		instance_destroy()
		exit;
	}
	
	var xDesired = anubisInstance.x 
	var yDesired = anubisInstance.y 
	
	var xDiff = getLoopDiff(x,xDesired)
	x += xDiff/10
	y += (yDesired-y)/10
	
	if(abs(xDiff)<8)
	{
		anubisInstance.enterFattening()
		instance_destroy()
	}
	break;
}