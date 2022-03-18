canShoot = 1

if(!flipLock) image_xscale = choose(-1,1)
if(tilemap_get_at_pixel(tileMap,x+32*image_xscale,y-16)>0) image_xscale=-image_xscale