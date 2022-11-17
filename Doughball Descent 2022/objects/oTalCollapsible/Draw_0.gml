draw_self();

if(expanded)
{
	draw_set_font(fntMini);
	draw_set_halign(fa_center);

	for(var i = array_length(food)-1; i>=0; i--)
	{
	
		draw_sprite(sFood,foodSprites[i],x+32+28*i,y-3)
		draw_text(x+32+28*i,y+10,string(food[i]))
	}
} else
{
	draw_set_font(fntBase);
	draw_set_halign(fa_left)
	
	draw_text(x+24,y-10,string(foodSum));
}