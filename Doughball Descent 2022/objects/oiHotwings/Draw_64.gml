if(!bought) exit;

if(flash>0) {
	
	gpu_set_fog(1,c_white,0,0)
	draw_self()
	gpu_set_fog(0,c_white,0,0)
	flash--;
	
} else draw_self();

var drawText = string(hotwingJumps);
draw_set_font(fntMini);
draw_set_color(c_yellow)
draw_text(x+32-string_width(drawText),y+20,drawText);
draw_set_color(c_white)
draw_set_font(fntBase);