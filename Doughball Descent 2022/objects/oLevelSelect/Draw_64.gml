if(!paused) exit;

if(state = 0)
{
	draw_set_color(c_purpGrey)
	draw_set_alpha(0.6)

	draw_rectangle(0,0,viewWidth,viewHeight,0)
	draw_set_color(c_white)
	draw_set_alpha(1)
	
	var charCount = array_length(playerChars)
	var _y, _text, _color
	for(var i = 0; i < charCount; i++)
	{
		_color = c_white
		if(pcUnlocks[i] = 0)
		{
			_text = pcLockedtext[i]
			_color = c_black
		}
		else
		{
			_text = playerChars[i]
		}
		
		if(i = cursorOn) 
		{
			_y = room_height/2-16
			draw_set_halign(fa_center)
			draw_text(100+(room_width-100)*i/charCount,_y + sprite_get_height(pcSprites[i])/2,_text)
		}
		else _y = room_height/2
		
		draw_sprite_ext(pcSprites[i],0,
		100+(room_width-100)*i/charCount,
		_y,1,1,0,_color,1)
	}
	draw_set_color(c_white)
}
else if(state = 1)
{
	draw_set_color(c_purpGrey)
	draw_set_alpha(0.6)

	draw_rectangle(0,0,viewWidth,viewHeight,0)
	draw_set_color(c_white)
	draw_set_alpha(1)

	wfOn+=0.1
	if(wfOn=wormFrames) wfOn-=wormFrames

	var vx = x-168
	var vy = 20;
	var va = make_color_hsv(0,0,200)

	for(var i = 0; i<5; i++) {
	
		if(i%2=0) vx = x-168	
		else vx = x-8
	
		//draw_rectangle(vx,vy,vx+176,vy+96,0)
		draw_sprite_ext(zonePreviews[i],0,vx,vy,176/sprite_get_width(zonePreviews[i]),96/sprite_get_height(zonePreviews[i]),0,va,1)
		draw_sprite(zoneWorm[i],wfOn,vx+88,vy+64)
	
		vy += 56
	}

	i = cursorOn;
	vy = 20+56*i

	if(i%2=0) vx = x-168	
	else vx = x-8

	draw_sprite_ext(zonePreviews[i],0,vx,vy,176/sprite_get_width(zonePreviews[i]),96/sprite_get_height(zonePreviews[i]),0,c_white,1)
	draw_sprite(zoneWorm[i],wfOn,vx+88,vy+64)
	draw_rectangle(vx,vy,vx+176,vy+96,1)
}