draw_set_alpha(image_alpha);
draw_self();

for(var i = array_length(p_array)-1; i>=0; i--)
{
	
	draw_sprite_ext(sConfetti,p_array[i,0],p_array[i,1],p_array[i,2],1,1,0,p_array[i,5],image_alpha)
}

draw_set_alpha(1);