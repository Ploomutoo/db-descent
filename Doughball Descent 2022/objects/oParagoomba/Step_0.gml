event_inherited();
if(!active) exit;

vspeed+=0.1

if(tsCheckEmpty(x-hbRad,y-16)||tsCheckEmpty(x+hbRad,y-16)){ 
	vspeed = max(2,vspeed)
} else if(tsCheckEmpty(x-hbRad,y+vspeed-2.5)||tsCheckEmpty(x+hbRad,y+vspeed-2.5)) {
	y=1+round((y+vspeed)/32)*32
	vspeed = -2.8
	image_index = 0
	image_speed = 1.2
}

if(turnedCooldown>0)turnedCooldown--
var desX = x+12*image_xscale

if(!tsCheckEmpty(desX,y-8)&&desX<room_width&&desX>0){
	x+=image_xscale
} else {
	if(turnedCooldown<=0){
		image_xscale = image_xscale*-1
		turnedCooldown = 30
	} else if(turnedCooldown=8) createParticles(x-2,y-16,2,sPaSweat)
}