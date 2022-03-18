soundDist(sndGumballToss,16,256)
//soundRand(sndGumballToss)

var shoot = instance_create_depth(x,y-12,depth-1,oGumball)
shoot.hDir = image_xscale
shoot.image_xscale = image_xscale

switch(cycle) {
	case 0:
		shoot.image_index = 0
		shoot.radius = 6
		shoot.bounce = 0.1
		shoot.vspeed = -2
		break;
	case 1:
		shoot.image_index = 1
		shoot.bounce = 0.4
		break; 
	case 2:
		shoot.image_index = 2
		shoot.radius = 4
		shoot.bounce = 0.6
		shoot.vspeed = -4
		cycle = -1
		break;
}

cycle++