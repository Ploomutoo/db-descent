///@description hMovement + Winstate
if(dead) exit

#region Movement
if(mobile){
	
	if((cLeft)&& !(cRight)){
		hFace = -1
		hspeed = clamp(hspeed-1,-maxSpeed,2)
	} else if ((cRight) && !(cLeft)){
		hFace = 1
		hspeed = clamp(hspeed+1,-2,maxSpeed);
	} else {
		hspeed = hspeed*0.8;
	}
}

if(x>room_width) x-=room_width
else if (x<0) x+=room_width

desX = bbox_left+hspeed
if(hspeed>0) desX = bbox_right+hspeed

var desX2= bbox_right+hspeed

if(desX>room_width) desX-=room_width
if(desX<0) desX += room_width

if(tsCheckEmpty(desX,y-2)||tsCheckEmpty(desX,y-collisionHeight)>0){
	hspeed = 0;	
}

if(desX<0) {
	x+=room_width;
} else if(desX2>room_width){
	x-=room_width;
}

desX = bbox_left
if(hFace=1) desX = bbox_right

if(bashActive>0) {
	
	funcBash(bashActive)
	
	bashActive--
	if(bashActive=0) 
	{
		funcBashend()
		
		image_index = 0
		extraBashFrames = 3;
	}
} else if(cBash && mobile) {
	
	funcBashinit()
	if(instance_exists(oiWreckingBall)) 
	{
		var wreckProj = instance_create_layer(desX+10*hFace,y-16,layer,oWreckingProj)
		wreckProj.image_xscale = hFace
		wreckProj.hspeed = hspeed+hFace*(2+oiWreckingBall.stacks)
	}
}

if(mobile = false) speed = 0
#endregion

#region Cosmetics
if(abs(hspeed)<1 || !grounded) {
	if(drawSin>1) drawSin = drawSin*0.8
	else drawSin = 0
	
} else {
	
	drawSin+=5*abs(hspeed)
	if(drawSin>360) drawSin -= 360
}

draw_angle = 4*dsin(drawSin)
drawOffset = 4*dsin(drawSin*2)
if(drawOffset<0) drawOffset = drawOffset/4

// DS-Scaling

	if(dsScalex>1) dsVelx-=0.05
	else if(dsScalex<1) dsVelx+=0.05

	dsScalex += dsVelx
	if(dsVelx != 0) dsVelx = approach(dsVelx,0,0.03)
	if(abs(dsScalex-1)<0.1) dsScalex = 1

	//Y Zone
	if(dsScaley>1) dsVely-=0.05
	else if(dsScaley<1) dsVely+=0.05

	dsScaley += dsVely
	if(dsVely != 0) dsVely = approach(dsVely,0,0.03)
	if(abs(dsScaley-1)<0.1) dsScaley = 1

#endregion

if(room != rChoice && tranLevel = -1 && y>endHeight) {
	soundRand(sndLevelEnd)
	setShopWidth()
	endHeight = -1

	if(combo>0)
	{
		alarm[1] = 0
		event_perform(ev_alarm,1)
	}
	
	tranLevel = 0;
}