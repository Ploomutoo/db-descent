gx = round(x/32)*32;
gy = round(y/32)*32;
facing = 1

if (tilemap_get(tileMap,gx,gy)=4) { instance_destroy(); exit; }
tilemap_set(tileMap, 0, gx,gy);

alarm[0] = 3;
