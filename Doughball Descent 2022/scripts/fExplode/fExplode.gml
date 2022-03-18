function fExplode(x,y,scale){
	var explodeObject = instance_create_depth(x,y,depth-1,oExplosion)
	
	oCamera.screenShake = scale*2
	scale = scale/2
	
	explodeObject.image_xscale = scale
	explodeObject.image_yscale = scale
	
	explodeObject.image_angle = choose(0,90,180,270)
}