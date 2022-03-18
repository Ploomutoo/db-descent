event_inherited();

var remove = instance_position(x+16,y+16,oHazGravel)
if(remove!=noone) with(remove){
	onDestroy = false
	instance_destroy()
}

image_speed = 0

if(bombBush || irandom(5) = 0) image_index = 1