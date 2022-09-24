owner = noone;
min_id = 0;

function taskReset() {
	
	speed = 0;
	taskState = false;
	taskTimer = 4*room_speed;
	taskFood = noone;
}

taskReset();
