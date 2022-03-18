if(image_index<1) exit;

if(tilemap_get_at_pixel(tileMap,x+hspeed,y)>0) {
	breakBlock(x+hspeed,y)
	instance_destroy();
}