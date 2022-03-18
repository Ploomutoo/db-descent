if(!active) exit

image_alpha = alarm[0]/30

ds_list_clear(foodList)

var vx = oPlayer.x + lengthdir_x(23,12)
var vy = oPlayer.y - 16 + lengthdir_y(23,12)

collision_circle_list(vx, vy, 600, oFood, 0, 0, foodList, 0);