expiry--
if(expiry=0) { instance_destroy(); exit; }

if(!tsCheckEmpty(bbox_left,y+radius)&&!tsCheckEmpty(bbox_right,y+radius)) {
	vspeed=min(vspeed+0.3,5)
	
	if(tsCheckEmpty(x,y+vspeed+radius)) {
		
		if(vspeed>1) soundDist(sndGumballBounce,32,96)
		
		y=round((y+vspeed+radius)/32)*32-radius
		vspeed = min(-vspeed*bounce,0)
	}
}

hspeed = hDir*2
image_angle -= hspeed*5
if(image_angle>360) image_angle-=360

var desX = hspeed+x
/*if(hspeed>0) hspeed+=bbox_right
else hspeed+=bbox_left*/


if(tsCheckEmpty(desX,y-4)) instance_destroy()
