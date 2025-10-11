if(alarm[0]>0) 
{
	draw_sprite_ext(sBigWormBounce,0,x,y,image_xscale,1,0,c_white,0.8)
	var absWidth = abs(sprite_get_width(sBigWormBounce)/2)

	if(x+absWidth>room_width) draw_sprite_ext(sBigWormBounce,image_index,x-room_width,y,image_xscale,1,image_angle,c_white,0.8)
	else if(x-absWidth<=0) draw_sprite_ext(sBigWormBounce,image_index,x+room_width,y,image_xscale,1,image_angle,c_white,0.8)
}
else drawLoop(x,y,sprite_index)