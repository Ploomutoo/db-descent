if(escapeTimer>0)
{
	var frame = sprite_get_number(sEscapeMeter) * escapeTimer / 60
	draw_sprite(sEscapeMeter,frame,oPlayer.x,oPlayer.y - 50)
}