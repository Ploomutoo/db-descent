draw_self()

if(price=0) exit;
if(playerOn) {
	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_bottom)
	
	draw_text_outlined(x+32,y,string(price))
	draw_text_outlined(x+32,y-22,altarText)
	
	draw_text_outlined(x+32,y+122,string(altarVal))
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)