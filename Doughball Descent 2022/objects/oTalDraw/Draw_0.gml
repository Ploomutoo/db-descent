//draw_sprite_ext(sEndFrame,0,x-16,y-16,frameSize,frameSize,0,c_white,1)
draw_sprite_ext(sEnding,image_index,x,y,spinScale,1,0,c_white,1)
//draw_sprite_ext(sEnding,1,x-160,y,0.5,0.5,0,c_white,1)

with(oTally) {
	var ix = 16
	var iy = 16
	var i = 0

	draw_text(ix,iy,"Ate: ")
	ix+=64
	
	draw_set_halign(fa_center)
	while(i<foodTypes){
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
	//draw_text(ix-12,iy+4,"Coming Soon?")
	
	ix = 16
	iy+=48
	draw_text(ix,iy,"Gained "+string(calGot)+"lbs")
	
	iy+=32
	draw_text(ix,iy,"Crushed "+string(foesStomped)+" foes")
	
	iy+=32
	draw_text(ix,iy,"Belly-bumped "+string(foesBomped)+" foes")
	
	iy+=32
	draw_text(ix,iy,"Traveled "+string(levelsGone)+" levels")
	
	
	iy=360-32
	draw_text(ix,iy,"Press SPACE to continue")
}