onDestroy = true;
//image_alpha = 0.5
if(tilemap_get_at_pixel(tileMap,x,y)=4) { onDestroy = false; instance_destroy(); }

tilemap_set_at_pixel(tileMap,4,x,y)
image_speed = 0
image_index = 0

hitFunc = function()
{
	soundRand(sndTileDamage)
	createEffect(x,y,sBlockHighlight)

	if(image_speed=1) exit;

	image_speed = 1
	alarm[0] = 0.6*room_speed

	audio_play_sound(sndSauceHiss,1,0)
}