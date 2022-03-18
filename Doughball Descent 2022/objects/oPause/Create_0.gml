//globalvar forceFreeze; forceFreeze = 0;

globalvar currentMusic; currentMusic = musLevel0;
globalvar txtSpeed;
autoPause = 0;

if(audio_group_is_loaded(agMusic)) alarm[0] = 2

audio_group_load(agMusic);

paused = false;

ini_open("config.ini")

menu[0,0] = "Master Volume"
menu[0,1] = ini_read_real("config","volumeMaster",8)
audio_set_master_gain(0,menu[0,1]/10)

menu[1,0] = "Music Volume"
menu[1,1] = ini_read_real("config","volumeMusic",8)
//if(menu[1,1]>0) 

menu[2,0] = "Screen Shake"
menu[2,1] = ini_read_real("config","screenshake",8)

menu[3,0] = "Fullscreen"
menu[3,1] = ini_read_real("config","fullscreen",false)
if(menu[3,1]) window_set_fullscreen(true)

menu[4,0] = "Text Speed"
menu[4,1] = ini_read_real("config","textDelay",1)
menu[4,1] = clamp(menu[4,1],1,3)
function updateTextSpeed(){
	switch menu[4,1] {
		case 1:
		txtSpeed = 3
		break;
		case 2:
		txtSpeed = 1
		break;
		case 3:
		txtSpeed = 6
		break;
	}
}
updateTextSpeed();

#macro optionEnd 5
menu[optionEnd,0] = "Back"
menu[optionEnd+1,0] = "Quit"
menu[optionEnd+1,1] = 0 // 0 is quit functionality. 1 is End Run
ini_close()

cursorOn = 0
deactList = ds_list_create()

function deactListAdd(object) {
	
	ds_list_add(oPause.deactList,object)
	
	instance_deactivate_object(object)
}

function deactListRemove(object) {
	
	ds_list_delete(oPause.deactList,ds_list_find_index(deactList,object))
	instance_activate_object(object)
}