if(room != rGame) exit;

var modx = x/2 mod bgX //get remainder of parallaxed X divided by background sprite width
var mody = y/2 mod bgY

var debugCol = c_white
if(cheat) debugCol = c_red
	
//draw_sprite_ext(bgSprite,0,c1leftbounds-modx,y-camHeight/2-mody,(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_red,1)
if(c1leftbounds>c2leftbounds) 
{
	
	var bg2x = 1+ceil(c2width/bgX);
	draw_sprite_ext(bgSprite,0,c1leftbounds-modx,y-camHeight/2-mody,(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_white,1)
	draw_sprite_ext(bgSprite,0,c2rightbounds-(bgX-modx)-c2width,y-camHeight/2-mody,bg2x,(camHeight+mody)/bgY,0,debugCol,1) //Wrapping right side
}
else 
{ //things are broken by leftbounds moving probably should stop using it
	
	var drawX = (c1leftbounds div bgX-1) * bgX //sanitize (round) bounds
	
	draw_sprite_ext(bgSprite,0,drawX+modx,y-camHeight/2-mody,2+(c1width+modx)/bgX,(camHeight+mody)/bgY,0,c_white,1)
	
	drawX = (1 + c2leftbounds div bgX-1) * bgX 

	draw_sprite_ext(bgSprite,0,drawX+modx-bgX,y-camHeight/2-mody,2+(c2width+modx)/bgX,(camHeight+mody)/bgY,0,debugCol,1) //on right, left panel
	
}