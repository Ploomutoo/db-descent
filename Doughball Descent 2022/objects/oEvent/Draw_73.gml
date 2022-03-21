if(state>0 && dim<30) {
	dim+=0.5
} else if(state<0) {
	dim--	
}

if(dim>0){
	draw_set_alpha(dim/60)
	draw_set_color(c_black)
	
	with(oCamera) draw_rectangle(x-camWidth/2,y-viewHeight/2,x+camWidth/2,y+viewHeight/2,0)
	draw_set_alpha(1)
	draw_set_color(c_white)
	
}