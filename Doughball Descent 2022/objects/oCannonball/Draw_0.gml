if(harmful && warnFlash<360) {
	warnFlash += 5;
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sWarning,0,x,oCamera.y-180,warnWidth,warnHeight,0,c_white,dsin(warnFlash))
	gpu_set_blendmode(bm_normal);
	//draw_set_alpha(1);
}
draw_self();