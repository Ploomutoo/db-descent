var _iy = y + 4
draw_set_font(fntMini)
for(var i = 0; i < array_length(tabs); i++)
{
	var _text = tabs[i].title
	var _textwidth = string_height(_text)
	var _textheight = string_width(_text)+8
	
	if(point_in_rectangle(mouse_x,mouse_y,x-_textwidth,_iy,x,_iy+_textheight))
	{
		soundRand(sndTextPick)
		tabSelected = i
		break;
	}
	
	_iy += _textheight + 4
}

_iy = y + 4
draw_set_font(fntBase)
for(i = 0; i < array_length(buttons); i++)
{
	_text = buttons[i].title
	_textwidth = string_width(_text)+8
	_textheight = string_height(_text)
	
	if(point_in_rectangle(mouse_x,mouse_y,bbox_right-_textwidth,_iy,bbox_right-4,_iy+_textheight))
	{
		buttons[i].func()
		break;
	}
	
	_iy += _textheight + 4
}