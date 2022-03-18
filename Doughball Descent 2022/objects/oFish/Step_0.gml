event_inherited();
if(!active) exit;

if(faceLeft){
	
	if(hspeed>desSpeed) hspeed-=0.05
	if(x<-length) x = room_width-desSpeed*15
} else {
	
	if(hspeed<desSpeed) hspeed+=0.05
	if(x>room_width+length) x = 0-desSpeed*15
}