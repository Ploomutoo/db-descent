sinCount+=3
if(sinCount>360) sinCount-=360

sinOut = 2*dsin(sinCount)

if(fastMode) {
	oPlayer.y+=5
	
	if(image_alpha<1) image_alpha += 2*(0.01-image_alpha/100)
	oCamera.yOffset-= 1+image_alpha
	exit;
}

if(cDown) {
	fastMode = true
	audio_play_sound(sndFastFall,0,0)
}

if(image_alpha<1) image_alpha += 0.01-image_alpha/100
oCamera.yOffset-= 1+image_alpha

x=oPlayer.x