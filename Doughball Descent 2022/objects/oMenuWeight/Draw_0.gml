//draw_self()
draw_sprite_part_ext(sPlayerBump,0,0,46*floor(weightInc),50,46,x-82,y-16,2,2,c_white,1)

draw_set_font(fntBase)
draw_text(x+14,y,"Eat food to gain weight\nWeight expands your hitbox and\ncauses you to break through\nmore blocks");

var i = floor(weightInc)

while(i>0) {
	
	if(i>4) draw_sprite(sIndicators,1,i*16-44,y+100)
	else draw_sprite(sIndicators,1,20+i*16,y+84)
	i--
}

draw_sprite_part(sPlayerBump,bashInc,0,46,46,46,16,y+128)
draw_sprite(sMenuBashables,bashablesInc,60,y+144)

draw_text(100,y+134,"Bash blocks and \nenemies with SPACE");