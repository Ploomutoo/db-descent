 event_inherited();

if(!instance_exists(oBrainFood)) instance_create_depth(x,y,0,oBrainFood)
oBrainFood.timerSet = (stacks+1)*30