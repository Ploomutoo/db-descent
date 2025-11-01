if(!bought) exit;


if(flash>0) 
{
	gpu_set_fog(1,c_white,0,0)
	flash--;
} 
if(guardGrainCooldown>0) 
{
	draw_sprite(sGuardgrainDisabled,0,x,y)
	
	draw_set_font(fntMini);
	draw_set_color(c_yellow);
	var drawText = string(guardGrainCooldown);
	draw_text(x+32-string_width(drawText),y+20,drawText);
	draw_set_font(fntBase);
	draw_set_color(c_white);
}
else draw_self()
gpu_set_fog(0,c_white,0,0)




