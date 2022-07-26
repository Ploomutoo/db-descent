/// @description fcheats
if(!cheat) {
	
	if(keyboard_check_pressed(ord("Q"))){
		if(environment_get_variable("USERNAME")="ploom") {
			cheat = true
			oCamera.screenShake = 10
			audio_play_sound(sndTally4,5,0)
		}
	}
	exit;
	
}

if(keyboard_check(vk_down)) {
	
	if(keyboard_check(vk_shift) && keyboard_check_pressed(vk_down)) y = room_height;
	
	y+=16
	vspeed = 0
} 

if(keyboard_check(vk_up)) {
	y-=16
	vspeed = 0
	//iframes = 3
}

/*if(keyboard_check(ord("Q"))) {
	if(keyboard_check(vk_shift) && keyboard_check_pressed(ord("Q"))) weight = floor(weight/100+1)*100
	else weight+=3
}*/

if(keyboard_check_pressed(ord("Q"))) {
	var i = get_integer("Set weight",100)
	if (i = undefined) exit;
	
	oTally.calGot += i-weight
	var popup = instance_create_layer(x,y-52,layer,oPopupText)
	popup.drawString = "+"+string(i-weight)
	
	weight = i
	oSidebarL.dWeight = i
}

if(keyboard_check_pressed(ord("L"))) {
	var i = get_integer("Go To Level",1)
	if (i = undefined || i>14) exit;
	
	level = i;
	y = room_height;
}
