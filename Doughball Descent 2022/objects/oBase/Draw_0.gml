if(!bought) exit;

draw_sprite(sprite_index,image_index,x,y);
if(stacks<2) exit;

var drawText = "x"+string(stacks);
draw_set_font(fntMini);
draw_text(x+32-string_width(drawText),y+20,drawText);
draw_set_font(fntBase);
