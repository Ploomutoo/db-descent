if(!instance_exists(oPlayer)) exit;

if (oPlayer.y < y-16) image_index = 3 //Up
else if(oPlayer.x < x-64) image_index = 0 //Left
else if(oPlayer.x > x+64) image_index = 2//Right

else image_index = 1 //neither