if(iframes>0) exit

if(other.facing=1){
	if(hspeed<-1) {
		hspeed = 4
		takeDamage()
	}
} else {
	if(hspeed>1) {
		takeDamage()
		hspeed = -4
	}
}