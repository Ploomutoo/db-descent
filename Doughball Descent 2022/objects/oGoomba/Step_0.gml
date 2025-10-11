event_inherited()

if(turnedCooldown>0)turnedCooldown--
if(image_index<1) exit;

var desX = x+16*image_xscale

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