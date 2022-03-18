event_inherited();

if(!instance_exists(oBrainFood)) instance_create_depth(x,y,0,oBrainFood)
else oBrainFood.timerSet += 30