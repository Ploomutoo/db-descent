event_inherited()

if(canShoot) {
	if(image_index>3){
		canShoot=false
		var shoot = instance_create_depth(x,y-12,depth-1,oOrange)
		shoot.hDir = image_xscale
		shoot.image_xscale = image_xscale
	}
}
