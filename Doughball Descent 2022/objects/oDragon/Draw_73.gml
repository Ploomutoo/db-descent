if(harmful) {
	
	if(fireball>0){
		
		var fb = fireball % 30
		if(fb % 30 <= 15) {
			if(fb = 0) audio_play_sound(sndDragonWarning,1,0);
			
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(sWarning,0,x-64,oCamera.y-180,warnWidth,warnHeight,0,c_white,0.5)
			gpu_set_blendmode(bm_normal);
		}
		fireball--
	}
	
	for(var i = 1; i<4; i++) {
		draw_sprite_ext(sprite_index,0,x,y-vspeed*i,1-i/8,1,0,c_white,1-(i+1)/8)
	}
	draw_self();
} else {
	
	if(sprite_index=sDragon2) draw_sprite_ext(sDragonIcon,image_index,x,y,1,1,0,c_white,iconAlpha)
	else draw_sprite_ext(sDragonIcon,0,x,y,1,1,0,c_white,iconAlpha)
}