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
	draw_set_valign(fa_top)
	for (var i = array_length(menu_main)-1; i>=0; i--)
	{	
		var drawText = menu_main[i];
		if (i = cursorOn) drawText = "> "+drawText;
		
		draw_text_outlined(viewWidth/2,iy,drawText)
		iy-=32;
	}
	draw_sprite(sDeweyPause,0,500,180)
	if(playerObj!=noone)
	{
		var _itemList = playerObj.items
		if(array_length(_itemList)>0)
		{
			var _spacing = 48
			var ix
			for(var i = 0; i < array_length(_itemList); i++)
			{
				ix = i%5
				iy = floor(i/5)
				draw_sprite(_itemList[i].sprite_index,_itemList[i].image_index,16+ix*_spacing,16+iy*_spacing)
				if(i = itemCursorOn)
				{
					draw_set_color(c_yellow)
					draw_rectangle(16+ix*_spacing,16+iy*_spacing,48+ix*_spacing,48+iy*_spacing,1)
				}
			}
			draw_set_font(fntMini)
			draw_set_halign(fa_left)
			draw_set_valign(fa_bottom)
			draw_text_ext(16,viewHeight-16,_itemList[itemCursorOn].nameTag+"\n"+_itemList[itemCursorOn].description,16,96)
		}
	}
	//draw_sprite(sCursor,0,mouse_x,mouse_y)
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
	
		draw_text_outlined(viewWidth/2-100,viewHeight/6+32*i,drawText)
	}
	#endregion
	draw_sprite(sDeweySettings,0,500,180)
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