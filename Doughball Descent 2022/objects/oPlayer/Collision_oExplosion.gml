if(iframes>0) exit
if(other.image_index>1) exit

var dir = point_direction(other.x,other.y,x,y)
motion_add(dir,10)
	
//soundRand(sndHurt)
takeDamage()
