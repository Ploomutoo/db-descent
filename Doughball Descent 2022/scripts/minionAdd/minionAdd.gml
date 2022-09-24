function minionAdd(ix,iy){
	
	with instance_create_layer(ix,iy,layer_get_id("instances"),oBlompoMinion) {
		owner = instance_nearest(x,y,oPlayer);
		if(owner=noone) show_debug_message("what")
		min_id = instance_number(oBlompoMinion);
	}
	with (oBlompoMinion) event_user(0);
}