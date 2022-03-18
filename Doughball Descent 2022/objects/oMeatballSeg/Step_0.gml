if(follow=noone) exit;
if(!instance_exists(follow)) {
	follow = noone;
	exit;
}

if(distance_to_object(follow)<4) exit;

move_towards_point(follow.x,follow.y,spd)