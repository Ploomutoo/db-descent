event_inherited()

if(!mobile)
{	
	hspeed = hspeed*0.8
	var desX = x+sign(hspeed)*24+hspeed
	if(tsCheckEmpty(desX,y-4))
	{
		hspeed = hspeed*-1
		x+=hspeed
	}
	
	exit;
}
	
if(turnedCooldown>0)turnedCooldown--
if(image_index<1) exit;

var desX = x+32*image_xscale

if(!tsCheckEmpty(desX,y-4)
  &&tsCheckEmpty(desX,y+4))
{
	x+=image_xscale*(1/image_index)
	
	if(x>room_width) x -= room_width
	else if(x<0) x += room_width
} 
else 
{
	if(turnedCooldown<=0){
		image_xscale = image_xscale*-1
		turnedCooldown = 30
	} else if(turnedCooldown=8) createParticles(x-2,y-16,2,sPaSweat)
}