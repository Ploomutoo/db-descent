function drawLoop(ix,iy,sprite){
	draw_self()
	var absWidth = abs(sprite_get_width(sprite)/2)

	if(ix+absWidth>room_width) draw_sprite_ext(sprite,image_index,ix-room_width,iy,image_xscale,1,image_angle,c_white,1)
	else if(ix-absWidth<=0) draw_sprite_ext(sprite,image_index,ix+room_width,iy,image_xscale,1,image_angle,c_white,1)
}