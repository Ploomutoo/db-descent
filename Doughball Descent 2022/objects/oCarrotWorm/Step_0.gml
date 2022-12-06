event_inherited()

if(turnedCooldown>0)turnedCooldown--
if(image_index>3) exit;

var desX = x+16*image_xscale

if(!tsCheckEmpty(desX,y-4)&&tsCheckEmpty(desX,y+4)&&x+image_xscale<room_width&&x+image_xscale>0){
	x+=image_xscale*(4/(image_index+1))
} else {
	if(turnedCooldown<=0){
		image_xscale = image_xscale*-1
		turnedCooldown = 30
	} else if(turnedCooldown=8) createParticles(x-2,y-16,2,sPaSweat)
}