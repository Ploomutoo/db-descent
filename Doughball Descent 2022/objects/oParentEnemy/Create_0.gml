//activateMinY = y-300
//activateMaxY = y+300
onDestroy = true
if(instance_position(x,y-8,oHazSpike)!=noone) { instance_expunge(); exit; }

calories = 10
stompable = true
active = false

depth-=1