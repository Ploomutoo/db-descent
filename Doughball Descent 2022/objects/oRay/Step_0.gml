event_inherited()

if(turnedCooldown>0)turnedCooldown--
var desX = x+16*image_xscale

if(!tsCheckEmpty(desX,y-4))
{
	x+=image_xscale*(4-image_index)/2
	
	if(x>room_width) x-=room_width
	else if(x<0) x+=room_width
} 
else 
{
	if(turnedCooldown<=0){
		image_xscale = image_xscale*-1
		turnedCooldown = 30
	} else if(turnedCooldown=8) createParticles(x-2,y-16,2,sPaSweat)
}