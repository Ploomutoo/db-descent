var ix = bgTilesX
var iy = bgTilesY + 1

var modx = x/2 mod bgX
var mody = y/2 mod bgY

cornerX = x-180 - modx
cornerY = y-180 - mody + bgyOffset

while(ix>=0){
	ix--
	while(iy>=0){
		iy--
		draw_sprite(bgSprite,0,cornerX+bgX*ix,cornerY+bgY*iy)
	}
	iy = bgTilesY
}