if(!active){
	if(oPlayer.y>y-cullDistance){
		active = true
	} else exit;
	
} else if(oPlayer.y>y+cullDistance) {
	onDestroy = false;
	instance_destroy()
}

if(standardGrav) {
	if(!tsCheckEmpty(bbox_left+1,y+2)&&!tsCheckEmpty(bbox_right-1,y+2)) {
		vspeed=min(vspeed+0.3,5)
	
		if(tsCheckEmpty(x,y+vspeed+2)) {
			y=round((y+vspeed+2)/32)*32
			vspeed = 0
		}
	
		exit;
	}
}