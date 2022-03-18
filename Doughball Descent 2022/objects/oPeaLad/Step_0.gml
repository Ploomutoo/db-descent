event_inherited()

if(!active) exit;

if(canShoot) {
	if(image_index>5){
		soundDist(sndPeaShot,96)
		
		canShoot=false
		var shoot = instance_create_depth(x+4*image_xscale,y-7,depth-1,oPea)
		shoot.hspeed = 3*image_xscale
		shoot.image_xscale = image_xscale
	}
}
