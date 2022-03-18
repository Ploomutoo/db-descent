if(!active) exit;
state++

//show_debug_message(string(state))

if(state=2) sprite_index = sGummyWormAttack
if(state>2) image_index=3 //state = 0; sprite_index = sGummyWorm; }

if(y<-256 || y>room_height+256) instance_expunge();