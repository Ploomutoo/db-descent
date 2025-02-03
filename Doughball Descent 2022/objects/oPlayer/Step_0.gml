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

var desX = bbox_left+hspeed
if(hspeed>0) desX = bbox_right+hspeed

var desX2= bbox_right+hspeed

if(tilemap_get_at_pixel(tileMap,desX,y-2)>0||tilemap_get_at_pixel(tileMap,desX,y-32)>0){
	hspeed = 0;	
}

if(desX<0) {
	//hspeed = 0
	//x = x-bbox_left
	x+=room_width;
} else if(desX2>room_width){
	//hspeed = 0
	//x = room_width + (x-bbox_right)
	x-=room_width;
}

desX = bbox_left
if(hFace=1) desX = bbox_right

if(bashActive>0) {
	bashActive--
	if(bashActive=0) image_index = 0
} else if(cBash && mobile) {
	bashActive = 20
	image_index = 1
	dsVelx = 0.3; dsVely = -0.15
	
	if(evKatsuma=1) { // Hurricane
		soundRand(sndHurricane);
		bashActive = 0;
		
		var hur = instance_create_depth(x,y,depth-1,oHurricane)
		hur.passenger = self; hur.hspeed = 0.8*(hFace+hspeed);
		hur.storedCrush = crushes; hur.drawWidth = (bbox_right-bbox_left)/32;
		//show_debug_message("drawWidth "+string(bbox_right-bbox_left))
		
		sprite_index = -1;
		crushes = 0;
		mobile = false;
	} else {
		soundRand(sndBash);
		
		var effect = instance_create_layer(desX+16*hFace,y-16,layer,oPaEffect)
		effect.sprite_index = sPaBash
		effect.image_index = 0
		effect.image_xscale = hFace
		effect.hspeed = hspeed
	}
	
	if(instance_exists(oiWreckingBall)) {
		effect = instance_create_layer(desX+10*hFace,y-16,layer,oWreckingProj)
		effect.image_xscale = hFace
		effect.hspeed = hspeed+hFace*(2+oiWreckingBall.stacks)
	}
}

if(bashActive>=15) //bash func
{ 
	
	var brokeBlock = breakBlock(desX+24*hFace,y-16,1)
	if (brokeBlock!=0) {
		
		bashActive = 16;
		createParticles(desX+24*hFace,y-16,6,sPaRock)
	}

	//var victim = instance_position(desX+16*hFace,y-16,oParentBashable)
	var victim = collision_rectangle(x,y-4,desX+32*hFace,y-32,oParentBashable,0,1);
	
	
	if(instance_exists(victim)) 
	{	
		victim.funcHurt(self,false)
		bashActive = 16
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

if(room != rChoice && tranLevel = -1 && y>room_height+32) {
	soundRand(sndLevelEnd)
	setShopWidth()
	//show_debug_message("Room:"+room_get_name(room))
	if(combo>0)
	{
		alarm[1] = 0
		event_perform(ev_alarm,1)
	}
	
	tranLevel = 0;
}