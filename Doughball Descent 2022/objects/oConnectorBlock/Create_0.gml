event_inherited();
connected = noone;

hitFunc = function()
{
	if(tsCheckEmpty(x,y)){
		instance_destroy(connected);
		instance_destroy();
	}
}