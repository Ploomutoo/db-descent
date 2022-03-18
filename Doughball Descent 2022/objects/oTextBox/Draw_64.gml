if(drawText = "") exit;

//gpu_set_blendmode(bm_normal)
draw_sprite_ext(sprite_index,0,x,y,drawWidth,drawHeight,0,c_white,1)


draw_set_halign(fa_center)
draw_text(x,y+2,drawText)
draw_set_halign(fa_left)