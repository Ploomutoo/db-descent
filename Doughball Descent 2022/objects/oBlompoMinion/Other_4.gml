if(instance_exists(owner)) {
	
	x = owner.x
	y = owner.y
	
	taskReset();
	taskTimer = taskTimer*min_id/instance_number(oBlompoMinion)
	
} else instance_destroy();
