if(fadeIn<500) {
	fadeIn+= 20	
	draw_sprite(sTransition,0,0,fadeIn-96)
	draw_sprite(sTransition,0,360,fadeIn-96)
	
	draw_set_color(c_black)
	draw_rectangle(0,fadeIn,640,361,0)
	draw_set_color(c_white)
} 
