if(x>room_width) x-=room_width
else if(x<0) x+=room_width

if(tilemap_get_at_pixel(tileMap,x+hspeed,y)>0) instance_destroy()