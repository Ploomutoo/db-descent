
draw_self()
if(price=0) exit;

draw_set_halign(fa_center)
draw_set_font(fntBase)
draw_text_outlined(x+16,y-18,string(price))
draw_set_halign(fa_left)