function pointDirLooping(_x1,_y1,_x2,_y2)
{
	if(_x1>_x2)
	{
		if(abs(_x1-(_x2+room_width))<abs(_x1-_x2)) _x2 += room_width
	}
	else if(_x1<_x2)
	{
		if(abs(_x1-(_x2-room_width))<abs(_x1-_x2)) _x2 -= room_width
	}
	return(point_direction(_x1,_y1,_x2,_y2))
}