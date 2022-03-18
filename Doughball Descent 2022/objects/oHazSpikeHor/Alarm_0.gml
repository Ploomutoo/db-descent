/// @Description Post-Create

if(tsCheckEmpty(x+facing*16,y-16)) { instance_destroy(); exit; }

image_xscale = facing
if(facing=-1) x+=32

var connectX = x-facing*32
if(facing=-1) connectX-=32

if(tilemap_get_at_pixel(tileMap,connectX,y-16)=4) { instance_destroy(); exit; }

/* var conflictor = instance_position(connectX+16,y-16,oHazFunctionBlock);

while(conflictor != noone) {
	instance_expunge(conflictor);
	conflictor = instance_position(connectX+16,y-16,oHazFunctionBlock);
	
	//instance_create_depth(connectX+16,y-16,0,oThumbtack)
}

conflictor = instance_position(connectX+16,y-8,oHazSpike);
if(conflictor!=noone) instance_expunge(conflictor); */

var connector = instance_create_depth(connectX,y-32,0,oConnectorBlock)
connector.connected = self