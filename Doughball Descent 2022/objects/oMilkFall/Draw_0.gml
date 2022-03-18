draw_self()

var i = 1
while(i<height) {
	draw_sprite(sMilk,image_index,x,y+32*i)
	i++
}

i--
draw_sprite(sMilkEnd,image_index,x,y+32*i)