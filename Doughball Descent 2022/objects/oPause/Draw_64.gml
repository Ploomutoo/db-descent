if(!paused) exit;

draw_set_color(c_black)
draw_set_alpha(0.5)

draw_rectangle(0,0,viewWidth,viewHeight,0)

draw_set_color(c_white)
draw_set_alpha(1)

draw_set_halign(fa_center)
draw_set_font(fntBig)
switch (mode)
{
	case "toplevel":
	var iy = viewHeight/6+array_length(menu_main)*32;
	for (var i = array_length(menu_main)-1; i>=0; i--)
	{	
		var drawText = menu_main[i];
		if (i = cursorOn) drawText = "> "+drawText;
		
		draw_text_outlined(viewWidth/2,iy,drawText)
		iy-=32;
	}
	break;
	
	case "settings":
	#region settings
	var drawText
	for(var i = 0; i<array_length(settings); i++){
	
		if(i=cursorOn) drawText = "> "
		else drawText = ""
		drawText = drawText + settings[i,0]
	
		switch i {
			case enSettings.masterVol:
			case enSettings.musicVol:
			case enSettings.screenShake:
				drawText = drawText + " - " + string(settings[i,1])
			break;
		
			case enSettings.fullscreen:
			case enSettings.squashStretch:
			case enSettings.sizeCap:
				if(settings[i,1]) drawText = drawText + "[On]"
				else drawText = drawText + "[Off]"
			break;
		
			case enSettings.textSpeed:
				if(settings[i,1]=1) drawText+= " - Standard"
				else if(settings[i,1]=2) drawText+= " - Fast"
				else if(settings[i,1]=3) drawText+= " - Slow"
			break;
		
			default:
			break;
		}
	
		draw_text_outlined(viewWidth/2,viewHeight/6+32*i,drawText)
	}
	#endregion
	break;
	
	case "reallyrestart":
	case "reallyquit":
		var iy = viewHeight/3;
		if(mode="reallyquit") draw_text_outlined(viewWidth/2,iy,"Really End Run?")
		else draw_text_outlined(viewWidth/2,iy,"Really Restart?")
		iy+=48;
		
		var drawText = "Yes"
		if(cursorOn = 0) drawText = "> " + drawText;
		draw_text_outlined(viewWidth/2,iy,drawText)
		iy+=32;
		
		var drawText = "No"
		if(cursorOn = 1) drawText = "> " + drawText;
		draw_text_outlined(viewWidth/2,iy,drawText)
	
	break;
}

draw_set_halign(fa_left)