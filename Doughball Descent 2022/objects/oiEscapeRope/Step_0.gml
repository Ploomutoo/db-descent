if(room != rGame) exit;

if(keyboard_check_pressed(ord("E")))
{
	escapeTimer = 60
}

if(keyboard_check_released(ord("E")))
{
	escapeTimer = -1	
}

if(escapeTimer>0)
{
	escapeTimer--
	if(escapeTimer = 0)
	{
		soundRand(sndThankYou)
		instance_create_depth(oPlayer.x,oPlayer.y-200,depth,oEscapeHook)
		
		removeItem(self)
		escapeTimer = -1
	}
}