speed = -2

if(image_index = 0){
	
	soundRand(sndTaiBreak);
	createParticles(x,y,6,sPaRock)
	
	desSpeed = desSpeed*2
	accel = 0.1
	image_index = 1
	
} else {
	
	soundRand(sndTaiSplat);
	createParticles(x,y,6,sPaMeat)
	
	accel +=0.02
}