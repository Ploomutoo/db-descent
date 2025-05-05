tFunc = function()
{
	switch(funcIndex)
	{
		case 0: //reset camera offset
		oCamera.yOffset = funcInt
		break;
		case 1: //slow fall
		with(oPlayer) 
		{
			loGrav(0.01,100)
			show_debug_message("Grav "+string(grav)+", Alarm "+string(alarm[2]))	
			roomGrav = other.funcInt
		}
		oCamera.yOffset = 100
		break;
	}
}