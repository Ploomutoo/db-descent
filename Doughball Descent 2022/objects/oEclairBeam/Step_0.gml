var endpoint
if(facing = 1) 
{
	if(oCamera.c2leftbounds = -1) //no looping
	{
		endpoint = oCamera.c1rightbounds
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
	}
	else if(oCamera.c1leftbounds = 0) //pane 1 is on right
	{
		endpoint = room_width
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
		if(childBeam = noone) childBeam = instance_create_depth(0,y,depth,oEclairBeamWrap)
		endpoint = oCamera.c1rightbounds
		childBeam.image_xscale = endpoint/sprite_get_width(sprite_index)
	}
	else //pane 1 is on left
	{
		endpoint = room_width
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
		if(childBeam = noone) childBeam = instance_create_depth(0,y,depth,oEclairBeamWrap)
		endpoint = oCamera.c2rightbounds
		childBeam.image_xscale = endpoint/sprite_get_width(sprite_index)
	}
}
else if(facing = -1)
{
	if(oCamera.c2leftbounds = -1) //no looping
	{
		endpoint = oCamera.c1leftbounds
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
	}
	else if(oCamera.c1leftbounds = 0) //pane 1 is on right
	{
		endpoint = 0
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
		if(childBeam = noone) childBeam = instance_create_depth(0,y,depth,oEclairBeamWrap)
		endpoint = oCamera.c1leftbounds
		childBeam.image_xscale = endpoint/sprite_get_width(sprite_index)
	}
	else //pane 1 is on left
	{
		endpoint = oCamera.c1leftbounds
		image_xscale = (endpoint-x)/sprite_get_width(sprite_index)
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