
function getLoopDiff(_x,_desired)
{
	if (_desired>room_width) _desired -= room_width
	
	var posDiff, negDiff
	if(_x > _desired) 
	{
		negDiff = _desired - _x
		posDiff = room_width-_x + _desired
	}
	else 
	{
		posDiff = _desired - _x
		negDiff = -_x + _desired-room_width
	}

	if(posDiff < abs(negDiff)) return(posDiff)
	else return(negDiff)
}