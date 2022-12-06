/// @description fcheats
enum eCheat {
	empty,
	toggle, //1
	setWeight,
	finishLevel, //3
	gotoStage,
	giveItem, //5
	takeItem,
	giveMinion, //7
	destroyFood
}
if(!cheat) {
	
	if(keyboard_check_pressed(ord(string(eCheat.toggle)))&&parameter_count()==3&&string_count("GMS2TEMP",parameter_string(2))){
		
		cheat = true
		oCamera.screenShake = 10
		audio_play_sound(sndTally4,5,0)
		
		popUp(x,y-48,"Cheats Enabled")
			
		fpsStored = fps_real;
		fpsNorm = 0;
		fpsInc = 30;
	}
	exit;
	
}

fpsNorm+=fps_real;
fpsInc--;
if(fpsInc<1) { fpsInc = 30; fpsStored = fpsNorm/fpsInc; fpsNorm = 0; }

if(keyboard_check(vk_down)) {
	y+=16
	vspeed = 0
} 

if(keyboard_check(vk_up)) {
	y-=16
	vspeed = 0
}

if(keyboard_check_pressed(ord(string(eCheat.setWeight)))) {
	var i = get_integer("Set weight",100)
	if (i = undefined) exit;
	
	oTally.calGot += i-weight
	var popup = instance_create_layer(x,y-52,layer,oPopupText)
	popup.drawString = "+"+string(i-weight)
	
	weight = i
	oSidebarL.dWeight = i
}

if(keyboard_check_pressed(ord(string(eCheat.giveItem)))) {
	var i = get_string("Give item","oiHeartbeet")
	if(string_copy(i,1,2)!="oi") exit;
	
	i = asset_get_index(i);
	if(object_exists(i)) addItem(i)
	
}

if(keyboard_check_pressed(ord(string(eCheat.takeItem)))) {
	var i = get_string("Remove item","oiHeartbeet")
	if(string_copy(i,1,2)!="oi") exit;
	
	i = asset_get_index(i);
	with(i) removeItem(self);
	//if(object_exists(i)) removeItem(i)
	
}

if(keyboard_check_pressed(ord(string(eCheat.finishLevel)))) {
	if(y<room_height) y = room_height;
}

if(keyboard_check_pressed(ord(string(eCheat.gotoStage)))) {
	var i = get_integer("Go To Level",1)
	if (i = undefined || i>14) exit;
	
	level = i;
	y = room_height;
}

if(keyboard_check_pressed(ord(string(eCheat.toggle)))) {
	
	popUp(x,y-48,"Cheats Disabled")
	cheat = false;
}

if(keyboard_check_pressed(ord(string(eCheat.giveMinion)))) {
	minionAdd(x,y);
}

if(keyboard_check_pressed(ord(string(eCheat.destroyFood)))) {
	with(oFood) instance_destroy();
}