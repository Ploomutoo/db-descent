switch(state)
{
	case anubisState.lineupH:
		image_xscale = facing
		xDesired = oPlayer.x - 240*facing
		yDesired = oPlayer.y
	break;
	
	case anubisState.punch:
		xDesired = oPlayer.x + 32*facing
		if(image_index > 5 && image_index < 9)
		{
			if(collision_rectangle(x+16*facing,y-16,x+32*facing,y+16,oPlayer,0,0)) with(oPlayer) takeDamage()	
		}
	break;
	
	case anubisState.castBalls:
		image_xscale = facing
		xDesired = oPlayer.x - 240*facing
		yDesired = oPlayer.y - castOffset
		
		castOffset -= 1
	break;
	
	default:
	break;
}
x += (xDesired-x)/20
y += (yDesired-y)/20