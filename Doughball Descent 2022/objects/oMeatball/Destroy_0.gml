event_inherited();

if(instance_exists(childSeg)) {
	childSeg.onDestroy = onDestroy
	instance_destroy(childSeg)
}