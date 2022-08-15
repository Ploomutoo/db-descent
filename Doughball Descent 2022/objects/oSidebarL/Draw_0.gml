if(!instance_exists(oPlayer)) exit;

draw_sprite_ext(sprite_index,0,x,y,1,1,0,colorA,1)

draw_set_color(c_black)
draw_rectangle(x,y,x+140,y+64,0)
draw_set_color(c_white)

var iy = y+4

if(oPlayer.weight!=dWeight){
	draw_set_color(c_yellow)
	
	if(oPlayer.weight>dWeight){
		dWeight+=0.5	
	} else if(oPlayer.weight<dWeight){
		dWeight-=1
	}
}
draw_set_font(fntBig)
var drawString = string(floor(dWeight))+" lbs"
var firstLet = string_char_at(drawString,0)

drawString = string_delete(drawString,1,1)
var flWidth = string_width(firstLet)

draw_text(x+4,iy-3,firstLet)
draw_set_font(fntBase)

draw_text(x+4+flWidth,iy,drawString)

iy+=16
draw_set_color(c_white)
draw_text(x+4,iy,levelText)
//draw_text(x+4,iy,"Players "+ string(instance_number(oPlayer)))


iy+=20
var j = oPlayer.heartMax
for(var i = 0; i<j; i++){
	
	if(i>=oPlayer.hearts) draw_sprite(sIndicators,2,x+4+i*8,iy)
	else draw_sprite(sIndicators,0,x+4+i*8,iy)
	
}
j += oPlayer.soulHearts
while(i<j){
	draw_sprite(sIndicators,4,x+4+i*8,iy)
	i++
}

i = oPlayer.crushMax
iy+=10
while(i>0){
	i--
	if(i>=oPlayer.crushes) draw_sprite(sIndicators,3,x+4+i*8,iy)
	else draw_sprite(sIndicators,1,x+4+i*8,iy)
}
