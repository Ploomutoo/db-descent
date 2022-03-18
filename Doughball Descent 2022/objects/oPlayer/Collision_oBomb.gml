if(iframes>0) exit
if(other.image_index>16){
	if(x>other.x) hspeed+=3
	else hspeed-=3
	
	soundRand(sndHurt)
	takeDamage()
}