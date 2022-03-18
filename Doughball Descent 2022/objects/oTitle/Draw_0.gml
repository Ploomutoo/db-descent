draw_self()

draw_set_font(fntBig)
draw_set_halign(fa_left)

var drawText
for(var i = 0; i<array_length(menu); i++){
	
	if(i=cursorOn) drawText = ">"
	else drawText = ""
	drawText = drawText + menu[i]
	
	draw_text_outlined(x-32,y+24+32*i,drawText)
}