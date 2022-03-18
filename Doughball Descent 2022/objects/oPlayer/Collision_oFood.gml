if(tilemap_get_at_pixel(tileMap,other.x,other.y)>0)exit;

var calGet = other.calories

calGet = calBonus(calGet)

var popup = instance_create_layer(other.x,other.y,layer,oPopupText)
popup.drawString = "+"+string(calGet)
weight+=calGet

if(instance_exists(oTally)){
	oTally.foodGot[other.image_index]++	
	//show_debug_message("Got "+string(oTally.foodGot[other.image_index])+" of "+string(other.image_index))
	oTally.calGot+=calGet
}

if(instance_exists(oiComfortFood)) iframes = max(iframes,30 + 30*instance_number(oiComfortFood))

with(oComboMeter) event_user(0)
with(oBrainFood) {
	active = true
	alarm[0] = timerSet
}

instance_destroy(other)

soundRand(sndFood)