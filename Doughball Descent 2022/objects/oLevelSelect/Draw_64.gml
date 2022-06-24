if(!paused) exit;

draw_set_color(c_purpGrey)
draw_set_alpha(0.6)

draw_rectangle(0,0,viewWidth,viewHeight,0)
draw_set_color(c_white)
draw_set_alpha(1)

wfOn+=0.1
if(wfOn=wormFrames) wfOn-=wormFrames

var vx = x-168
var vy = 20;
var va = make_color_hsv(0,0,200)

for(var i = 0; i<5; i++) {
	
	if(i%2=0) vx = x-168	
	else vx = x-8
	
	//draw_rectangle(vx,vy,vx+176,vy+96,0)
	draw_sprite_ext(zonePreviews[i],0,vx,vy,176/sprite_get_width(zonePreviews[i]),96/sprite_get_height(zonePreviews[i]),0,va,1)
	draw_sprite(zoneWorm[i],wfOn,vx+88,vy+64)
	
	vy += 56
}

i = cursorOn;
vy = 20+56*i

if(i%2=0) vx = x-168	
else vx = x-8

draw_sprite_ext(zonePreviews[i],0,vx,vy,176/sprite_get_width(zonePreviews[i]),96/sprite_get_height(zonePreviews[i]),0,c_white,1)
draw_sprite(zoneWorm[i],wfOn,vx+88,vy+64)
draw_rectangle(vx,vy,vx+176,vy+96,1)
