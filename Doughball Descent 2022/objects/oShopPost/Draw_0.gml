event_inherited()

if(price=0) exit;
if(playerOn) {
	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_bottom)
	draw_set_color(c_black)
	draw_text_ext(x+15,y-22,item.description,16,128)
	draw_text_ext(x+17,y-22,item.description,16,128)
	draw_text_ext(x+16,y-21,item.description,16,128)
	draw_text_ext(x+16,y-23,item.description,16,128)
	draw_set_color(c_white)
	draw_text_ext(x+16,y-22,item.description,16,128)
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)