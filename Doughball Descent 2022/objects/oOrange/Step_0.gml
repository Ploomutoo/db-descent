event_inherited();
if(!active) exit;

/*var offset = 5
if(!tsCheckEmpty(bbox_left,y+offset)&&!tsCheckEmpty(bbox_right,y+offset)) {
	vspeed=min(vspeed+0.3,5)
	
	if(tsCheckEmpty(x,y+vspeed+offset)) {
		y=round((y+vspeed+offset)/32)*32-offset
		vspeed = 0
	}
}*/

hspeed = hDir*2
dAngle -= hspeed*5
if(dAngle>360) dAngle-=360

var desX = hspeed+x
/*if(hspeed>0) hspeed+=bbox_right
else hspeed+=bbox_left*/


if(tsCheckEmpty(desX,y-4)) instance_destroy()
