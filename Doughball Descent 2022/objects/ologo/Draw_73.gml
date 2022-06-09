draw_set_halign(fa_center)
draw_text_outlined(x,y+140,"Plubsoft Games")

draw_set_halign(fa_left)

if(alarm[0]<30) {
	
	draw_set_color(c_black);
	draw_set_alpha(1-alarm[0]/30)

	draw_rectangle(0,0,640,360,0)
	draw_set_color(c_white);
	draw_set_alpha(1)
}

