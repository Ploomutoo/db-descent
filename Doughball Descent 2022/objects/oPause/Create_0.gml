//globalvar forceFreeze; forceFreeze = 0;

globalvar currentMusic; currentMusic = musLevel0;
globalvar txtSpeed;
globalvar devMode; devMode = false;

if(devMode) if(file_exists("progress.ini")) file_delete("progress.ini");

autoPause = 0;
paused = false;

function settingsReset() {
	
	ini_open("config.ini")
	
	menu[0,0] = "Master Volume"
	menu[0,1] = ini_read_real("config","volumeMaster",5)
	audio_set_master_gain(0,menu[0,1]/10)

	menu[1,0] = "Music Volume"
	menu[1,1] = ini_read_real("config","volumeMusic",3)
	audio_group_set_gain(agMusic,menu[1,1]/10,0)
	//if(menu[1,1]>0) 

	menu[2,0] = "Screen Shake"
	menu[2,1] = ini_read_real("config","screenshake",5)

	menu[3,0] = "Fullscreen"
	menu[3,1] = ini_read_real("config","fullscreen",false)
	if(menu[3,1]) window_set_fullscreen(true)

	menu[4,0] = "Squash 'n Stretch"
	menu[4,1] = ini_read_real("config","squashNstretch",true)

	#macro tspeedCoord 5
	menu[tspeedCoord,0] = "Text Speed"
	menu[tspeedCoord,1] = ini_read_real("config","textDelay",1)
	menu[tspeedCoord,1] = clamp(menu[tspeedCoord,1],1,3)
	function updateTextSpeed(){
		switch menu[tspeedCoord,1] {
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

	#macro optionEnd 6
	menu[optionEnd,0] = "Back"
	
	if(room=rTitle || room=rTally){
		menu[optionEnd+1,0] = "Quit"
		menu[optionEnd+1,1] = 0
	} else {
		menu[optionEnd+1,0] = "End Run"
		menu[optionEnd+1,1] = 1
	}
	ini_close()
}

settingsReset();
playMusic(musLevel0);

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