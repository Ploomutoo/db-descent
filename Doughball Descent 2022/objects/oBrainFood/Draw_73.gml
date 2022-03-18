if(!active) exit

var i = ds_list_size(foodList)
var angle = 0

while(i>0){
	i--
	
	if(!instance_exists(foodList[|i])) break;
	
	angle = point_direction(oPlayer.x,oPlayer.y-16,foodList[|i].x,foodList[|i].y)
	
	draw_sprite_ext(sprite_index,foodList[|i].image_index % 4,
	oPlayer.x+lengthdir_x(32,angle),oPlayer.y-16+lengthdir_y(32,angle),
	1,1,angle,c_white,image_alpha)
}