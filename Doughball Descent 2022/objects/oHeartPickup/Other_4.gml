iterationCap = 5
while(tilemap_get_at_pixel(tileMap,x,y)>1 || instance_place(x,y,oHazSpike)!=noone){
	x-=32
	if(x<0) x+=room_width
	iterationCap--
	if(iterationCap<0) instance_destroy();
}