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
	
	case anubisState.fattening:
		image_xscale = facing
		xDesired = oPlayer.x - 240*facing
		yDesired = oPlayer.y
		
		if(image_index > image_number-1) 
		{
			state = anubisState.fattened
			sprite_index = sAnubisFat
			soundRand(sndBash)
		}
	break;
	
	case anubisState.fattened:
		image_xscale = facing
		xDesired = oPlayer.x - 240*facing
		yDesired = oPlayer.y - castOffset
		
		castOffset -= fallSpeed
		fallSpeed += 0.1
		
		if(castOffset<-600) fattenEnd()
	break;
	
	default:
	break;
}

x += getLoopDiff(x,xDesired)/20
y += (yDesired-y)/20