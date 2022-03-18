///@description hMovement + Winstate

if(dead) exit
if((cLeft)&& !(cRight)){
	hFace = -1
	hspeed = clamp(hspeed-1,-maxSpeed,2)
} else if ((cRight) && !(cLeft)){
	hFace = 1
	hspeed = clamp(hspeed+1,-2,maxSpeed);
} else {
	hspeed = hspeed*0.8;
}

var desX = bbox_left+hspeed
if(hspeed>0) desX = bbox_right+hspeed

var desX2= bbox_right+hspeed

if(tilemap_get_at_pixel(tileMap,desX,y-2)>0||tilemap_get_at_pixel(tileMap,desX,y-32)>0){
	hspeed = 0;	
}

if(desX<0) {
	hspeed = 0
	x = x-bbox_left
} else if(desX2>room_width){
	hspeed = 0
	x = room_width + (x-bbox_right)
}

desX = bbox_left
if(hFace=1) desX = bbox_right

if(bashActive>0) {
	bashActive--
	if(bashActive=0) image_index = 0
} else if(cBash) {
	bashActive = 20
	soundRand(sndBash)
	image_index = 1
	
	var effect = instance_create_layer(desX+16*hFace,y-16,layer,oPaEffect)
	effect.sprite_index = sPaBash
	effect.image_index = 0
	effect.image_xscale = hFace
	effect.hspeed = hspeed
	
	if(wreckingStacks>0) {
		effect = instance_create_layer(desX+10*hFace,y-16,layer,oWreckingProj)
		effect.image_xscale = hFace
		effect.hspeed = hspeed+hFace*(2+wreckingStacks)
	}
}

if(bashActive>15){
	
	if (breakBlock(desX+24*hFace,y-16)!=0) createParticles(desX+24*hFace,y-16,6,sPaRock)
	
	//var victim = instance_position(desX+16*hFace,y-16,oParentBashable)
	var victim = collision_rectangle(x,y-8,desX+24*hFace,y-32,oParentBashable,0,1);
	with(victim) event_user(0)
	
	if(instance_exists(victim)) bashActive = 10
}

if(mobile = false) speed = 0

if(abs(hspeed)<1 || !grounded) {
	if(drawSin>1) drawSin = drawSin*0.8
	else drawSin = 0
	
} else {
	
	drawSin+=5*abs(hspeed)
	if(drawSin>360) drawSin -= 360
}

image_angle = 4*dsin(drawSin)
drawOffset = 4*dsin(drawSin*2)
if(drawOffset<0) drawOffset = drawOffset/4

if(tranLevel = -1 && y>room_height+32) {
	soundRand(sndLevelEnd)
	setShopWidth()
	//show_debug_message("Room:"+room_get_name(room))
	tranLevel = 0;
}