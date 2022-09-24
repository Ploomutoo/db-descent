if(!instance_exists(owner)) exit;

if(taskState) {
	if(speed<3) speed+=0.1;
	taskDistance-=speed;
	
	if(taskDistance<1) {
	
		with(taskFood) with(other.owner) event_perform(ev_collision,oFood);
		taskReset();
		exit;
	}
	
} else {
	
	var mountx = owner.x+mountOffx;
	var mounty = owner.y+mountOffy;

	var dist = distance_to_point(mountx,mounty);
	direction = point_direction(x,y,mountx,mounty);

	if(dist>15) speed = 5;
	else speed = dist/3;
	
	taskTimer--;
	if(taskTimer<1) {
		
		var food = instance_nearest(x,y,oFood)
		if(food = noone || distance_to_object(food)>256 || tilemap_get_at_pixel(tileMap,food.x,food.y)!=0) {
			taskReset();
			taskTimer = room_speed*1;
			exit;
		}
		taskState = true;
		with(oBlompoMinion) if(!taskState){
			taskTimer+=room_speed;
		}
		
		direction = point_direction(x,y,food.x,food.y);
		taskDistance = point_distance(x,y,food.x,food.y);
		taskFood = food;
		
	}
}
