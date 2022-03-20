draw_self()

draw_set_font(fntBig)
draw_set_halign(fa_left)

var drawText;
var drawy = y+24;
for(var i = 0; i<array_length(menu); i++){
	
	var drawx = x-32
	drawText = menu[i]
	
	if(i=cursorOn) {
		
		draw_sprite(sMenuMark,0,drawx,drawy+string_height(drawText)/2)
		drawx+=6
	}
		
	draw_text_outlined(drawx,drawy,drawText)
	drawy+=string_height(drawText)
}