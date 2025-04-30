if(active)
{
	x+=3*dsin(wobble)
	wobble+=wobSpeed
	if(wobble>360)wobble-=360
	
	y+=2*(1-abs(dsin(wobble)))
	image_index = lerp(0,image_number-0.1,abs(dsin(wobble)))
	
	if(y>oCamera.y+cullDistance) {
		
		ds_list_add(mother.poolInactive,self)
		active = false;
	}

	//collision code
	var maybePlayer = instance_place(x,y,oPlayer)
	if(maybePlayer = noone) 
	{
		if(bbox_right>room_width) maybePlayer = instance_place(x-room_width,y,oPlayer)
		else if(bbox_left<0) maybePlayer = instance_place(x+room_width,y,oPlayer)
	}
	
	if(maybePlayer != noone && maybePlayer.y<y && maybePlayer.vspeed>1)
	{
		ds_list_add(mother.poolInactive,self)
		active = false;
	
		createParticles(x,y-8,5,sPaLeaves)
		soundRand(sndCotw);
	
		maybePlayer.vspeed = -10
		maybePlayer.crushes = 0
	}
}