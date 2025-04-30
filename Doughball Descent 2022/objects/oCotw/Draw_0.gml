if(active) 
{	
	draw_self();
	if(bbox_right>room_width) draw_sprite(sprite_index,image_index,x-room_width,y)
	else if(bbox_left<0) draw_sprite(sprite_index,image_index,x+room_width,y)
}