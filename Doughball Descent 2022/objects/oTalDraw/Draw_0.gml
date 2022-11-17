//draw_sprite_ext(sEndFrame,0,x-16,y-16,frameSize,frameSize,0,c_white,1)
draw_sprite_ext(sEnding,image_index,x,y,spinScale,1,0,c_white,1);
draw_rectangle(x-79,y+84,x+78,y+88,1);

if("sndTally2"!=audio_get_name(cdSound)) {
	draw_set_color(c_yellow);
	draw_rectangle(x-79,y+84,x+78,y+88,0); draw_set_color(c_white);
	
} else {
	draw_set_color(c_grey);
	draw_rectangle(x-79,y+84,x+lerp(78,-79,xpCost/(lvl*xpInc)),y+88,0); draw_set_color(c_white);
	
}

with(oTally) {
	var ix = 16
	var iy = 8
	//var i = 0
	draw_set_font(fntBase);
	draw_set_halign(fa_left);
	draw_text(ix,iy,"Ate: ")
	
	/*ix+=64
	draw_set_halign(fa_center)
	while(i<other.foodTallyOn){
		if(foodGot[i]>0) {
			draw_sprite(sFood,i,ix,iy+11)
			draw_text(ix,iy+20,string(foodGot[i]))
			ix+=32
		}
		
		i++
		if(i=12) {
			iy+=48
			ix = 80
		}
	}
	draw_set_halign(fa_left)
	*/
	
	iy = 224
	ix = 16
	
	draw_text(ix,iy,"Gained "+string(other.calDisplay)+"lbs")
	
	iy+=24
	draw_set_font(fntMini);
	draw_text(ix,iy,"Crushed "+string(foesStomped)+" foes")
	
	iy+=16
	draw_text(ix,iy,"Belly-bumped "+string(foesBomped)+" foes")
	
	iy+=16
	draw_text(ix,iy,"Traveled "+string(levelsGone)+" levels")
	
	iy=360-24
	draw_text(ix,iy,"Press SPACE to continue")
	
	ix = room_width-48
	iy = room_height-48
	for(var i = ds_list_size(itemsGot)-1; i>=0; i--) {
		draw_sprite(sItems,itemsGot[|i],ix-32*(i%5),iy-32*floor(i/5))
	}
}

