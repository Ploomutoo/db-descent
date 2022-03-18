function bellyFlopSplash(seperation,flopStacks) {
	//if(instance_number(oiBellyFlop))
	
	var flopSpeed = sqrt(flopStacks)/2
	var splash = instance_create_layer(x+seperation/2,y-2,layer,oBellyFlopProj)
	splash.hspeed = flopSpeed
	
	splash = instance_create_layer(x-seperation/2,y-2,layer,oBellyFlopProj)
	splash.image_xscale = -1
	splash.hspeed = -flopSpeed
}