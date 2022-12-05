event_inherited()

if(canShoot) {
	if(image_index>3){
		canShoot=false
		var shoot = instance_create_depth(x,y-12,depth-1,oGumball)
		shoot.sprite_index = sOrange;
		shoot.hDir = image_xscale
		shoot.bounce = 0.2
		shoot.image_xscale = image_xscale
	}
}
