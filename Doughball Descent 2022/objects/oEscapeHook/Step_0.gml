switch(state)
{
	case "searching":
		var xdif = oPlayer.x - x
		var ydif = oPlayer.y - y

		if(abs(xdif) + abs(ydif) < 8)
		{
			x += xdif
			y += ydif
		
			state = "hooked"
			oPlayer.mobile = false
			oPlayer.tranLevel = -2
			oCamera.lockCam = true
			image_index = 2
		}
		else 
		{
			x += xdif/10
			y += ydif/10
		}
		break;
	
	case "hooked":
		oPlayer.x = x
		oPlayer.y = y
	
		y -= upRate
		upRate += 0.2
		if(y < oCamera.y-200)
		{
			soundRand(sndLevelEscape)
			state = "finish up!"
		}
		break;
	
	case "finish up!":
		room_goto(rEvent)
	
		oPlayer.mobile = true
		oPlayer.x = 512
		oPlayer.y = 0
		oPlayer.tranLevel = -1
		oPlayer.endHeight = 0

		oCamera.lockCam = false
	
		genShop()
		instance_destroy()
	break;
}


