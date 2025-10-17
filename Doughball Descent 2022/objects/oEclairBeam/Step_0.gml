var endpoint
if(facing = 1) 
{
	endpoint = oCamera.c1rightbounds
	//if(endpoint > x) endpoint = oCamera.c2rightbounds
	image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
	
	if(endpoint = room_width)
	{
		if(childBeam = noone) childBeam = instance_create_depth(0,y,depth,oEclairBeamWrap)	
		endpoint = oCamera.c2rightbounds
		childBeam.image_xscale = endpoint/sprite_get_width(sprite_index)
	}
}
else if(facing = -1)
{
	endpoint = oCamera.c1leftbounds
	//if(endpoint < x) endpoint = oCamera.c2leftbounds
	image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
	
	if(endpoint = 0)
	{
		if(childBeam = noone) childBeam = instance_create_depth(room_width,y,depth,oEclairBeamWrap)	
		endpoint = oCamera.c2leftbounds
		childBeam.image_xscale = (endpoint-room_width)/sprite_get_width(sprite_index)
	}
}

if(!harmful && image_index>4) { 
	harmful = true;
	var volume = 64/abs(y-oPlayer.y)
	//show_debug_message("volume " + string(volume))
	volume = min(volume,1)	
	
	audio_sound_gain(sndBeam,volume,0)
	audio_play_sound(sndBeam,-1,0)
}