var tp = toPlace/travelTime

internalAngle++
if(internalAngle = 5) {
	image_angle -= 45
	internalAngle = 0
}

x = lerp(fromX,toX,tp);
y = lerp(fromY,toY,tp);

image_xscale = lerp(0.2,1,tp)
image_yscale = image_xscale

if(toPlace>=travelTime){
	depth = oPlayer.depth
	fExplode(x,y,2)
	soundRand(sndDragonBlast)
	instance_destroy();
}

toPlace += 1

warningTick += warningTickRate
if(warningTickRate<5) warningTickRate += 0.2

if(warningTick>50) warningTick = 0