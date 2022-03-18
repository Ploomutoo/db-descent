event_inherited();
if(instance_exists(oComboMeter)){
	oComboMeter.timeOut += 30
} else {
	instance_create_layer(x,y,layer,oComboMeter)
}