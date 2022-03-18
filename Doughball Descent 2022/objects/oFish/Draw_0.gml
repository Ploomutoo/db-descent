//draw_self()
var drawMult = 1
if(!faceLeft) drawMult = -1 

draw_sprite_part_ext(sFish,image_index,0,0,16,16,x,y,drawMult,1,c_white,1);
var i = 1

while(i<=boneLength){
	draw_sprite_part_ext(sFish,image_index,16,0,16,16,x+16*i*drawMult,y,drawMult,1,c_white,1);
	i++
}

draw_sprite_part_ext(sFish,image_index,32,0,16,16,x+16*i*drawMult,y,drawMult,1,c_white,1);