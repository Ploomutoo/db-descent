y = lerp(y,yDesired,0.2);

var checkObj = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oParentBashable,0,false);
with(checkObj) funcHurt(self,false)

if(hspeed != 0)
{
	var checkPos = x + sprite_width/2*sign(hspeed)
	var bounce = false
	var top = y-24, bottom = y+24
	for(var _iy = top; _iy < bottom; _iy+=32)
	{
		if(tsCheckEmpty(checkPos,_iy)) bounce = true
	}
	if(tsCheckEmpty(checkPos,bottom)) bounce = true
	if(bounce) 
	{
		//x-=hspeed
		hspeed *= -0.25
	}
	hspeed *= 0.99
}

with(passenger) {
	
	x = other.x;
	y = other.y;
}
