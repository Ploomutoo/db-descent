if(dead) exit;
if(iPushFrames>0)exit;

var colDir = point_direction(x,y,other.x,other.y)

if(other.danger){
	if(iframes>0) exit;
	takeDamage();
	motion_add(colDir+180,8)
	exit;
}



if(y<other.y){
	vspeed = -2
	if(jumpedTimer>0) vspeed = -6
	soundRand(sndStomp)
} else if(other.y>y-24) {
	
	iPushFrames = 30
	
	motion_add(colDir+180,8)
	
}