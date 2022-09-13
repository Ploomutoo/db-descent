if(dead) exit

audio_listener_position(x, y, 0);

if(iframes>0) iframes--
if(iPushFrames>0) iPushFrames--

if(weight!=lastWeight) {
	
	crushMax = floor(weight/100)*crushMultiplier
	
	if(weight<=100) grav = baseGrav
	else grav = baseGrav + 0.1 *(baseGrav*(weight/100-1))
	
	fallMax = 6+(grav-baseGrav)*10
	if(fallMax>10) fallMax = 10
	
	spritePart = clamp(floor(weight/100)-1,-1,weightStages-2)
	
	belly_damping = 0.1
	belly_elasticity = 0.5
	if (spritePart>3) {
		belly_damping = 0.05
		belly_elasticity = 0.3
	}
	
	girth = 1 + (weight/100-(spritePart+1))/16
	// If there is another stage, it presumably will cap at 100
	// Girth will then be at most 1.0625
	// Girth over 1.0625 will be progressively reduced
	
	if(girth>1.0625){
		var exGirth = girth-1.0625
		girth = 1.0625 + exGirth/2
	}
	
	var dsWidth = surface_get_width(drawSurf)
	while(dsWidth<58*girth) dsWidth = dsWidth*2
	surface_resize(drawSurf,dsWidth,64)
	
	// Hitbox = 16 px (10 x 1.6) at 100
	//			18 px (10 x 1.8) at 200
	// And So On

	image_xscale = 1.4 + weight/100*0.2
	
	if(tsCheckEmpty(bbox_left,y-16)) x++
	if(tsCheckEmpty(bbox_right,y-16)) x--
	
	lastWeight = weight
}

grounded = !tsSpanEmpty(y+1,bbox_left+1,bbox_right-1)

if (grounded) {
	
	if(vspeed>0){
		
		breakLine(y+2,bbox_left,bbox_right-1)
		
		y=round(y/16)*16+1
		dsScalex = 1.5; dsScaley = 0.6
		
		if(crushes<1) vspeed = 0;
		else vspeed = -1
		
		if(instance_exists(oiBellyFlop)) bellyFlopSplash(bbox_right-bbox_left+16,oiBellyFlop.stacks)
		
	} else {
		
		if(!fallReset) {
			
			fallReset = 1;
			hTumDuration = -1;
			dsScalex = 1.5; dsScaley = 0.6
		}
		y=round(y/16)*16+1
		vspeed = 0
	}
} else {
	
	
	if(instance_exists(oiHeliumTum)) {
		
		if(cJump && !hTumActive && hTumDuration=-1) {
			audio_play_sound(sndHTumIn,5,0)
			vspeed = -1
			hTumDuration = 30+(oiHeliumTum.stacks-1)*15 
			dsVelx = 0.3; dsScaley = 1.2
			hTumActive = true;
		}
	}
	
	if(vspeed<0) {
		
		//going up
		if(!cJumpDown) vspeed = vspeed*0.7
		vspeed+=baseGrav //Use Base Gravity when Ascending to preserve Jump Apex
		
		if(!tsSpanEmpty(y-30,bbox_left+2,bbox_right-2))	vspeed = 2 //hit head
		
	} else if(apexTime>0) {
		
		apexTime--
		
	} else {
		//going down
		
		if(crushes>0) { //Falling Effect
			if(counterFallEffect>= 4) { createEffect(x+irandom_range(-3,3),y-48,sPaMotion); counterFallEffect = 0; }
			counterFallEffect++
		}		
		
		if(cJumpDown){
			if(hTumActive && hTumDuration>0){
				
				hTumDuration--
				vspeed+=grav*0.2
				vspeed = min(vspeed,fallMax/3)
				
				if(hTumDuration=0) {
					vspeed = vspeed*2
					hTumActive = false
					dsVelx = -0.2
					audio_play_sound(sndHTumOut,5,0)
				}
				
			} else vspeed+=grav*0.8
			
		} else {
			hTumActive = false;
			vspeed+=grav
		}
	}
	
}

if(cJump) jumpedTimer = 10

if(jumpedTimer>0 || autoJump){
	
	if(grounded) {
		if(breakOnJump) breakLine(y+2,bbox_left,bbox_right)
		
		vspeed -= 4;
		with(oiPowerKnees) other.vspeed -= stacks/2;
		jumpedTimer = 0
		crushes = crushMax	
		
	} else jumpedTimer--
}

vspeed = clamp(vspeed,-fallMax,fallMax)
if(room = rTransition) vspeed = 6

if(vspeed>2 && fallReset = 1){
	fallReset = 0	
	crushes = crushMax	
	//crushes = 0
}