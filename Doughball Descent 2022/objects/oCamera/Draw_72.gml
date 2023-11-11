//var ix = bgTilesX
//var iy = bgTilesY

var modx = x/2 mod bgX //get remainder of parallaxed X divided by background sprite width
var mody = y/2 mod bgY

//cornerX = x-180 - modx
//cornerY = y-180 - mody + bgyOffset


draw_sprite_ext(bgSprite,0,c1leftbounds-modx,y-camHeight/2-mody,(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_white,1)
if(c1leftbounds>c2leftbounds) { //this one works
	
	var bg2x = 1+ceil(c2width/bgX);
	draw_sprite_ext(bgSprite,0,c1leftbounds-modx,y-camHeight/2-mody,(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_white,1)
	draw_sprite_ext(bgSprite,0,c2rightbounds-(bgX-modx)-c2width,y-camHeight/2-mody,bg2x,(camHeight+mody)/bgY,0,c_white,1)
}
else { //things are broken by leftbounds moving probably should stop using it
	
	var drawX = (c1leftbounds div bgX-1) * bgX //sanitize (round) bounds
	draw_sprite_ext(bgSprite,0,drawX+modx,y-camHeight/2-mody,1+(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_white,1)
	
	drawX = (c2leftbounds div bgX-1) * bgX
	draw_sprite_ext(bgSprite,0,drawX+modx,y-camHeight/2-mody,1+(c2width+modx)/bgX,(camHeight+mody)/bgY,0,c_red,1)
	
}
/*while(ix>=0){
	ix--
	while(iy>=0){
		iy--
		draw_sprite(bgSprite,0,cornerX+bgX*ix,cornerY+bgY*iy)
	}
	iy = bgTilesY
}*/