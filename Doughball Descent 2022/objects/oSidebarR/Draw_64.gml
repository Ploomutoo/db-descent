var iy = 8
var ix = dispWidth-8

draw_set_halign(fa_right)
draw_text(ix,iy,string(level))
	
if(room=rGame) {
	ix-=16
	iy+=4+string_height("12")
	draw_sprite_ext(sprite_index,0,ix,iy,1,1,0,colorB,1)
	draw_sprite(sprite_index,1,ix,iy+drawProg)

	draw_set_halign(fa_left)
}

if(!instance_exists(oPlayer)) exit;

draw_set_color(c_white)
iy = 8
ix = 8;

if(oPlayer.weight!=dWeight){
	draw_set_color(c_yellow)
	
	if(oPlayer.weight>dWeight){
		dWeight+=0.5	
	} else if(oPlayer.weight<dWeight){
		dWeight-=1
	}
}
draw_set_font(fntBig)
draw_set_halign(fa_left)
var drawString = string(floor(dWeight))+" lbs"
var firstLet = string_char_at(drawString,0)

drawString = string_delete(drawString,1,1)
var flWidth = string_width(firstLet)

draw_text_outlined(ix,iy-3,firstLet)
draw_set_font(fntBase)

draw_text_outlined(ix+flWidth,iy,drawString)

draw_set_color(c_white)
iy+=25

var indSize = sprite_get_width(sIndicators)
var j = oPlayer.heartMax
for(var i = 0; i<j; i++){
	
	if(i>=oPlayer.hearts) draw_sprite(sIndicators,2,ix+i*indSize,iy)
	else draw_sprite(sIndicators,0,ix+i*indSize,iy)
	
}
j += oPlayer.soulHearts
while(i<j){
	draw_sprite(sIndicators,4,ix+i*indSize,iy)
	i++
}

i = oPlayer.crushMax
iy+=17
ix-=2
while(i>0){
	i--
	if(i>=oPlayer.crushes) draw_sprite(sIndicators,3,ix+i*indSize,iy)
	else draw_sprite(sIndicators,1,ix+i*indSize,iy)
}