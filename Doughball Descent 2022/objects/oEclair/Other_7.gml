if(!flipLock) image_xscale = choose(-1,1)
if(tilemap_get_at_pixel(tileMap,x+32*image_xscale,y-16)>0) image_xscale=-image_xscale

if(!active) exit;

shootStage++;
if(shootStage > 2) {
	if(shootStage = 3)
	{
		sprite_index = sEclairShoot;
		
		shoot = instance_create_depth(x+16*image_xscale,y+7,depth-1,oEclairBeam);
		shoot.facing = image_xscale;
		
	} 
	else
	{
		shootStage = 0;
		sprite_index = sEclair;
	}
}