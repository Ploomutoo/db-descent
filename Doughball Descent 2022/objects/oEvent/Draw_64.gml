if(state = 2) {
	draw_sprite(sTextChoice,choice,dx,dy)
	if(cLeftPressed||cRightPressed) {
		audio_play_sound(sndMenuNext,2,0)
		choice = !choice
	}
	
	draw_set_halign(fa_center)
	draw_text(dx,dy+32,drawText)
	draw_set_halign(fa_left)
}