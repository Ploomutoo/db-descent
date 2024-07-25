sinCount+=3
if(sinCount>360) sinCount-=360

sinOut = 2*dsin(sinCount)

if(fastMode) {
	oPlayer.y+=5
	
	if(image_alpha<1) image_alpha += 2*(0.01-image_alpha/100)
	oCamera.yOffset-= 2+min(5,15/(alarm[0]+1))
	
	exit;
}

if(cDown || cBash) {
	if(alarm[0]>0) exit;
	
	alarm[0] = 30
	fastMode = true
	
}

if(image_alpha<1) image_alpha += 0.01-image_alpha/100
x=oPlayer.x