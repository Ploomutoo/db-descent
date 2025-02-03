event_inherited();

if(tilemap_get_at_pixel(tileMap,x,y)=4) { onDestroy = false; instance_destroy(); }
tilemap_set_at_pixel(tileMap,4,x,y)
image_speed = 0