//draw_sprite_ext(sEndFrame,0,x-16,y-16,frameSize,frameSize,0,c_white,1)
draw_sprite_ext(sEnding,image_index,x,y,spinScale,1,0,c_white,1);
draw_rectangle(x-79,y+84,x+78,y+88,1);

if(audio_is_playing(sndTally3)) {
	draw_set_color(c_yellow);
	draw_rectangle(x-79,y+84,x+78,y+88,0); draw_set_color(c_white);
	
} else {
	draw_set_color(c_grey);
	draw_rectangle(x-79,y+84,x+lerp(78,-79,xpCost/(lvl*500)),y+88,0); draw_set_color(c_white);
	
}

with(oTally) {
	var ix = 16
	var iy = 16
	var i = 0

	draw_text(ix,iy,"Ate: ")
	ix+=64
	
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
	iy = 128;
	draw_set_halign(fa_left)
	//draw_text(ix-12,iy+4,"Coming Soon?")
	
	ix = 16
	iy+=48
	draw_text(ix,iy,"Gained "+string(other.calDisplay)+"lbs")
	
	iy+=32
	draw_text(ix,iy,"Crushed "+string(foesStomped)+" foes")
	
	iy+=32
	draw_text(ix,iy,"Belly-bumped "+string(foesBomped)+" foes")
	
	iy+=32
	draw_text(ix,iy,"Traveled "+string(levelsGone)+" levels")
	
	
	iy=360-32
	draw_text(ix,iy,"Press SPACE to continue")
}