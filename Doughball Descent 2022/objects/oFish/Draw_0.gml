//draw_self()
var drawMult = 1
if(!faceLeft) drawMult = -1 

draw_sprite_part_ext(sFish,image_index,0,0,16,16,x,y,drawMult,1,c_white,1);
var ix = x + 16*drawMult

for(var _i = 1; _i <= boneLength;)
{
	draw_sprite_part_ext(sFish,image_index,16,0,16,16,ix,y,drawMult,1,c_white,1);
	ix += 16*drawMult
	
	if(ix>room_width) ix -= room_width - 16*drawMult
	else if(ix<0) ix += room_width - 16*drawMult
	else 
	{
		_i++
	}
}

draw_sprite_part_ext(sFish,image_index,32,0,16,16,ix,y,drawMult,1,c_white,1);