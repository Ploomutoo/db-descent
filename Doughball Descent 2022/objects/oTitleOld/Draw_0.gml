if(screen=0) {
	//draw_self()
	draw_set_halign(fa_center)
	draw_set_font(fntBase)
	if(flashOn) draw_text(x,360-24,"Press SPACE to Continue")
	
	draw_set_halign(fa_right)
	draw_text(636,4,"Soundtrack by Abstraction\nabstractionmusic.com")
	
	draw_set_halign(fa_left)
	draw_text(4,4,"A game by P&D <3\n(c)2020") 
	
	//draw_sprite_ext(sprites[selection],0,34,342,1,1,0,global.playerCol,1)
} else {
	draw_text(32,room_height-42,"Press SPACE to Continue")	
}