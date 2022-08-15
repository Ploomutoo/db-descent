draw_self();

if(state=0) {
	
	draw_set_halign(fa_center);
	draw_text(x,y-16-sprite_height,event.eName);
	draw_set_halign(fa_left);
}
