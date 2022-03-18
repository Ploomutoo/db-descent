var enemy = other

if(y<enemy.y) {
	//Squash
	vspeed = -2
	if(jumpedTimer>0) vspeed = -6
	soundRand(sndStomp)
	weight+=enemy.calories
} else {
	//Ow
	hspeed+=enemy.image_xscale*5
	image_xscale = -enemy.image_xscale
	soundRand(sndHurt)
	takeDamage()
}

instance_destroy(enemy)