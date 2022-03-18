if(!tsCheckEmpty(x,y+2)) {
	vspeed=min(vspeed+0.3,5)
	
	if(tsCheckEmpty(x,y+vspeed+2)) {
		y=round((y+vspeed+2)/32)*32
		vspeed = 0
	}
}
if(hspeed!=0){
	var desX = hspeed
	
	if(hspeed>1) desX+=bbox_right
	else desX+=bbox_left
	
	if(tsCheckEmpty(desX,y-4)){
		hspeed=-hspeed/2
	}
	
	hspeed=hspeed*0.9
}