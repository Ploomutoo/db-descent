if(!active){
	if(oPlayer.y>y-cullDistance){
		active = true
	} else exit;
	
} else if(oPlayer.y>y+cullDistance) {
	onDestroy = false;
	instance_destroy()
}

var _diff = getLoopDiff(x,oPlayer.x)

if(_diff>0) hspeed+=0.2
else if(_diff<0) hspeed-=0.2

if(x>room_width) x -= room_width
else if(x<0) x += room_width

hspeed = clamp(hspeed,-5,5)
image_angle=hspeed*3

cannonCounter--;
if(cannonCounter<1 && abs(x+16-oPlayer.x)<16){
	
	soundRand(sndBoom);
	instance_create_layer(x+9,y-15,layer,oCannonball)
	
	image_index = 1
	image_speed = 1
	
	cannonCounter = cannonCooldown
	
}

y=homeMilk.y+3