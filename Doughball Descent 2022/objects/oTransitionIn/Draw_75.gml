if(y>-100) 
{
	draw_sprite_ext(sprite_index,0,0,y,width,-1,0,c_white,1)
	draw_set_color(c_black)
	draw_rectangle(0,0,640,y-96,0)
	draw_set_color(c_white)
}

if(text != "")
{
	draw_sprite_ext(sStageIntro,0,320,textOffset,1,1,0,c_white,0.5)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fntBig)
	draw_text_outlined(320,textOffset,text)
	draw_set_font(fntMini)
	draw_set_valign(fa_top)
} 