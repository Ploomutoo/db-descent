draw_self()
draw_set_font(fntMini)
var _iy = y + 4
var _text,_textwidth,_textheight,_subimage
for(var i = 0; i < array_length(tabs); i++)
{
	_text = tabs[i].title
	_textwidth = string_height(_text)+2
	_textheight = string_width(_text)+8
	_subimage = 1
	if(i = tabSelected) _subimage = 0
	
	draw_sprite_ext(sEditorTab,_subimage,x-_textwidth+1,_iy,_textwidth/sprite_get_width(sEditorTab),_textheight/sprite_get_height(sEditorTab),0,c_white,1)
	draw_set_color(c_black)
	draw_text_transformed(x-_textwidth+3,_iy+_textheight-4,tabs[i].title,1,1,90)
	draw_set_color(c_white)
	_iy += _textheight + 4
}

var _ix = x
if(sprite_exists(tabs[tabSelected].sprite))
{
	for(i = 0; i < tabs[tabSelected].subimages; i++)
	{
		draw_sprite(tabs[tabSelected].sprite,i,_ix,y)
		_ix += sprite_get_width(tabs[tabSelected].sprite)
	}
}

_iy = y + 4
draw_set_font(fntBase)
for(i = 0; i < array_length(buttons); i++)
{
	_text = buttons[i].title
	_textwidth = string_width(_text)+8
	_textheight = string_height(_text)
	
	draw_sprite_ext(sEditorWindow,0,bbox_right-_textwidth-4,_iy,_textwidth/sprite_get_width(sEditorWindow),_textheight/sprite_get_height(sEditorWindow),0,c_white,1)
	draw_set_color(c_black)
	draw_text(bbox_right-_textwidth,_iy,buttons[i].title)
	draw_set_color(c_white)
	_iy += _textheight + 4
}