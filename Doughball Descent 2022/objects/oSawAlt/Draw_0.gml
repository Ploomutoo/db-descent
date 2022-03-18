var wx = anchorX
var wy = anchorY



repeat(chainLength) {
	
	draw_sprite_ext(sLollichopShaft,0,wx,wy,1,1,chainAngle,c_white,1)
	wx += lengthdir_x(32,chainAngle)
	wy += lengthdir_y(32,chainAngle)
	
}

draw_self()

//draw_sprite(sLollichopFastener,0,x,y)
draw_sprite(sLollichopFastener,0,anchorX,anchorY)