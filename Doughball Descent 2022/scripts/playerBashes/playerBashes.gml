function bashinitDewey()
{
	bashActive = 20
	
	image_index = 1
	dsVelx = 0.3; dsVely = -0.15
	
	soundRand(sndBash);
	var effect = instance_create_layer(desX+16*hFace,y-16,layer,oPaEffect)
	effect.sprite_index = sPaBash
	effect.image_index = 0
	effect.image_xscale = hFace
	effect.hspeed = hspeed
}
function bashDewey(_bashCounter)
{	
	if(_bashCounter<15) exit;

	var brokeBlock = breakBlock(desX+24*hFace,y-16,1)
	if (brokeBlock!=0) {
		
		bashActive = 10;
		createParticles(desX+24*hFace,y-16,6,sPaRock)
	}
	var check_x = [x,desX+32*hFace]
	var victim = collision_rectangle(check_x[0],y-4,check_x[1],y-32,oParentBashable,0,1);
	if(victim=noone)
	{
		if(check_x[1]>room_width)
		{
			victim = collision_rectangle(0,y-4,check_x[1]-room_width,y-32,oParentBashable,0,1);
		}
		else if(check_x[1]<0)
		{
			victim = collision_rectangle(room_width,y-4,check_x[1]+room_width,y-32,oParentBashable,0,1);
		}
	}
	
	if(instance_exists(victim))   
	{	
		with(victim) funcHurt(self,false)
		
		if(extraBashFrames>0)
		{
			bashActive = 16;
			extraBashFrames--;
		}
	}
}
function bashendDewey()
{
	
}

function bashinitKatsuma()
{
	bashActive = 20
	
	soundRand(sndHurricane);
	bashActive = 0;
		
	var hur = instance_create_depth(x,y,depth-1,oHurricane)
	hur.passenger = self; hur.hspeed = 0.8*(hFace+hspeed);
	hur.storedCrush = crushes; hur.drawWidth = (bbox_right-bbox_left)/32;
	//show_debug_message("drawWidth "+string(bbox_right-bbox_left))
		
	sprite_index = -1;
	crushes = 0;
	mobile = false;
}
function bashKatsuma(_bashCounter)
{
	
}
function bashendKatsuma()
{
	
}