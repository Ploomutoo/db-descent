draw_sprite_ext(sprite_index,0,x,y,1,1,0,colorA,1)
draw_sprite_ext(sprite_index,1,x,y,1,1,0,colorB,1)

draw_sprite(sprite_index,2,x,y)

if(room!=rGame) exit

draw_sprite(sAltometer,0,x+57,14+drawProg)
draw_text(x+90,14+drawProg,string(playerDepth)+"m")

draw_set_halign(fa_center)
draw_text(x+70,342,string(mapHeight)+"m")
draw_set_halign(fa_left)