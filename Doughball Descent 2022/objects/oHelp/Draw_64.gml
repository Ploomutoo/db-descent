if(!paused) exit;

draw_set_color(c_purpGrey)
draw_set_alpha(0.9)

draw_rectangle(0,0,viewWidth,viewHeight,0)

draw_set_color(c_white)

if(screen = 0) {
	
	draw_set_alpha(0.4)
	if(cursorOn = 0) draw_set_alpha(1)
	draw_sprite(sHelp,0,0,0)
	draw_set_alpha(0.4)

	if(cursorOn = 1) draw_set_alpha(1)
	draw_sprite(sHelp,1,0,0)
	draw_set_alpha(0.4)

	if(cursorOn = 2) draw_set_alpha(1)
	draw_sprite(sHelp,2,0,0)
	draw_sprite(sHelpArrows,image_index,466,218)
	draw_set_alpha(1)
	
} else {
	draw_sprite(sHelp,3,0,0)
	
	draw_set_font(fntBase)
	draw_set_halign(fa_center)
	
	draw_text_outlined(viewWidth/2,230,
	"Soundtrack by Abstraction (abstractionmusic.com)" +
	"\nArea 2 & 5 Theme by Toffee (@spleeeep)" +
	"\nSound Effects from Zapsplat, Hanna Barbera SFX Library 5, BFXR" +
	"\nGMRoomPack by YellowAfterlife" +
	"\nCompassGold Font by Somepx")

	draw_set_halign(fa_left)
}