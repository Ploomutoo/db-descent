event_inherited();
if(!active) exit;
else if (speed = 0) speed = spd

var potH = x
	if(hspeed!=0) potH+=16*sign(hspeed)
var potV = y
	if(vspeed!=0) potV+=16*sign(vspeed)

if(tsCheckEmpty(potH,potV)||potH<0||potH>viewWidth) {
	
	countdown = 0
}

countdown-=abs(x-lastX)
countdown-=abs(y-lastY)

lastX = x
lastY = y

if(countdown<1){
	
	//if(tsCheckEmpty(x+16,y)&&tsCheckEmpty(x-16,y)&&tsCheckEmpty(x,y+16)&&tsCheckEmpty(x,y-16)) instance_destroy()
	
	var noLock = 0
	speed = spd
	direction+=turnDir*90
	potH = x
			if(hspeed!=0) potH+=16*sign(hspeed)
	potV = y
		if(vspeed!=0) potV+=16*sign(vspeed)
	
	while(tsCheckEmpty(potH,potV)||potH<0||potH>viewWidth){
		
		//createEffect(potH,potV,sPaSparkle)
		
		speed = spd
		direction+=turnDir*90
		
		potH = x
			if(hspeed!=0) potH+=16*sign(hspeed)
		potV = y
			if(vspeed!=0) potV+=16*sign(vspeed)
		
		noLock++
		if(noLock=4) {
			instance_expunge();
			exit
		}
	}
	
	turnDir = choose(1,-1)
	countdown = irandom_range(1,4)*32
}