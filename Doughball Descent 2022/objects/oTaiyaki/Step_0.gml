event_inherited();
if(!active) exit;

if(faceLeft){
	
	if(hspeed>desSpeed) hspeed-=accel
	if(x<-length) x = room_width-desSpeed*15
} else {
	
	if(hspeed<desSpeed) hspeed+=accel
	if(x>room_width+length) x = 0-desSpeed*15
}

sinCount+=5
if(sinCount>360) sinCount-=360
y+=dsin(sinCount);

bubTimer--;
if(bubTimer<1){
	var bubX = x
	if(!faceLeft) bubX +=8
	else bubX -=16

	var bubble = createEffect(bubX,y-24,sPaBubble)
	bubble.hspeed = hspeed+sign(desSpeed)*4
	bubble.friction = bubble.speed/30
	bubble.image_index+=(x%3)/2
	
	bubTimer = 20
}