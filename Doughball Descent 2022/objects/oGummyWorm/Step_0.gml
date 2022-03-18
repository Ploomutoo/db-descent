event_inherited();
if(!active) exit;

if(state>=2 && image_index>2){
	
	if(vspeed = 0) soundDist(sndGummyJump,32,256)
	
	vspeed = -3*image_yscale
	
	//var checkPoint = y-24*image_yscale
	
	if(tsCheckEmpty(x,y-24*image_yscale)){
		
		//markPoint(x,checkPoint)
		state = irandom_range(-3,-1)
		
		soundDist(sndGummyLand,32,192)
		sprite_index = sGummyWorm
		
		y = round((y-16*image_yscale)/32)*32
		image_yscale = -image_yscale
		
		vspeed = 0
		
	}
	
} else {
	
	if(!tsCheckEmpty(bbox_left+1,y+2*image_yscale)&&!tsCheckEmpty(bbox_right-1,y+2*image_yscale)) {
		
		vspeed=min(vspeed+0.3,5)
	
		if(tsCheckEmpty(x,y+vspeed+2*image_yscale)) {
			y=round((y+vspeed+2*image_yscale+2*image_yscale)/32)*32
			
			image_yscale = 1
			//soundRand(sndDragonWarning)
			vspeed = 0
		}
	
		exit;
	}
	
	//if(image_yscale=-1) if(!tsCheckEmpty(x,y-4)) { vspeed = 0; y+=4*image_yscale }
	
	if(turnedCooldown>0)turnedCooldown--
	if(image_index>4) exit;
	if(state>=2) exit;

	var desX = x+16*image_xscale

	if(!tsCheckEmpty(desX,y-4*image_yscale)&&tsCheckEmpty(desX,y+4*image_yscale)&&x+image_xscale<room_width&&x+image_xscale>0){
		x+=image_xscale/(1+image_index)
	} else {
		if(turnedCooldown<=0){
			image_xscale = image_xscale*-1
			turnedCooldown = 30
		} else if(turnedCooldown=8) {
			state = 1
			image_index = image_number
			//createParticles(x-2,y-16,2,sPaSweat)
		}
	}

} 