onDestroy = true;
tilemap_set_at_pixel(tileMap,4,x,y)

hitFunc = function()
{
	tileHealth--
	soundRand(sndTileDamage)

	if(tileHealth<=0) instance_destroy();
	else createEffect(x,y,sBlockHighlight)
}