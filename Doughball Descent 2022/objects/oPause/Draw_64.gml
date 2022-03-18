if(!paused) exit;

draw_set_color(c_black)
draw_set_alpha(0.5)

draw_rectangle(0,0,viewWidth,viewHeight,0)

draw_set_color(c_white)
draw_set_alpha(1)

draw_set_halign(fa_center)
draw_set_font(fntBig)

var drawText
for(var i = 0; i<array_length(menu); i++){
	
	if(i=cursorOn) drawText = ">"
	else drawText = ""
	drawText = drawText + menu[i,0]
	
	switch i {
		case 0:
		case 1:
		case 2:
			drawText = drawText + " - " + string(menu[i,1])
		break;
		
		case 3:
			if(menu[i,1]) drawText = drawText + "[On]"
			else drawText = drawText + "[Off]"
		break;
		
		case 4:
			if(menu[i,1]=1) drawText+= " - Standard"
			else if(menu[i,1]=2) drawText+= " - Fast"
			else if(menu[i,1]=3) drawText+= " - Slow"
		break;
		
		default:
		break;
	}
	
	draw_text_outlined(viewWidth/2,84+32*i,drawText)
}

draw_set_halign(fa_left)