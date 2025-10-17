draw_self()

if(price=0) exit;
if(playerOn) {
	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_bottom)
	
	var _indulgence = instance_find(oiIndulgence,0)
	if(_indulgence != noone && _indulgence.indulgenceStacks > 0)
	{
		draw_text_outlined(x+32,y,"FREE")
	}
	else draw_text_outlined(x+32,y,string(price))
	
	draw_text_outlined(x+32,y-22,altarText)
	draw_text_outlined(x+32,y+122,string(altarVal))
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)