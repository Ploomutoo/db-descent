event_inherited();
if(!active) exit;

if(turnedCooldown>0)turnedCooldown--

var desX = x+16*image_xscale

if(!tsCheckEmpty(x,y-48)) { playerKill(self); instance_destroy() }

if(canFire && image_index>4){
	canFire = false
	//audio_sound_pitch(sndSquirt,1+random_range(-0.3,0.3))
	soundDist(sndSquirt,128)
	
	instance_create_depth(x,y-16,depth-1,oUdderProj)
}

if(floor(image_index) mod 2 = 1) exit;

if(!tsCheckEmpty(desX,y-16)&&tsCheckEmpty(desX,y-48)&&x+image_xscale<room_width&&x+image_xscale>0){
	x+=image_xscale*1
} else {
	if(turnedCooldown<=0){
		image_xscale = image_xscale*-1
		turnedCooldown = 30
	} else if(turnedCooldown=8) createParticles(x-2,y-16,2,sPaSweat)
}