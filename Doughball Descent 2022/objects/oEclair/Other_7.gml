if(!flipLock) image_xscale = choose(-1,1)
if(tilemap_get_at_pixel(tileMap,x+32*image_xscale,y-16)>0) image_xscale=-image_xscale

if(!active) exit;

shootStage++;
if(shootStage > 2) {
	if(shootStage = 3){
		sprite_index = sEclairShoot;
		
		shoot = instance_create_depth(x+16*image_xscale,y+7,depth-1,oEclairBeam);
		//shoot.hspeed = 3*image_xscale
		shoot.image_xscale = image_xscale;
		with(shoot){
			var endpoint; 
			if(image_xscale = 1) endpoint = room_width;
			else endpoint = 0;
			
			image_xscale = abs(x-endpoint)/sprite_width
		}
		
	} else {
		shootStage = 0;
		sprite_index = sEclair;
	}
}