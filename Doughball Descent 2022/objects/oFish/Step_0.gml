event_inherited();
if(!active) exit;

if(hspeed>desSpeed) hspeed-=0.05
else if(hspeed<desSpeed) hspeed+=0.05

if(x>room_width) x -= room_width
else if(x<0) x += room_width