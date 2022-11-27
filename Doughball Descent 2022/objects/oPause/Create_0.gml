//globalvar forceFreeze; forceFreeze = 0;
//control S to reset

globalvar currentMusic; currentMusic = musLevel0;
globalvar txtSpeed;
globalvar devMode; devMode = false;

if(devMode) if(file_exists("progress.ini")) file_delete("progress.ini");

autoPause = 0;
paused = false;
enum settings {
	masterVol,
	musicVol,
	screenShake,
	fullscreen,
	squashStretch,
	sizeCap,
	textSpeed,
	back,
	quit
}
function settingsReset() {
	
	ini_open("config.ini")
	
	menu[settings.masterVol,0] = "Master Volume"
	menu[settings.masterVol,1] = ini_read_real("config","volumeMaster",5)
	audio_set_master_gain(0,menu[0,1]/10)

	menu[settings.musicVol,0] = "Music Volume"
	menu[settings.musicVol,1] = ini_read_real("config","volumeMusic",3)
	audio_group_set_gain(agMusic,menu[1,1]/10,0)
	//if(menu[1,1]>0) 

	menu[settings.screenShake,0] = "Screen Shake"
	menu[settings.screenShake,1] = ini_read_real("config","screenshake",5)

	menu[settings.fullscreen,0] = "Fullscreen"
	menu[settings.fullscreen,1] = ini_read_real("config","fullscreen",false)
	if(menu[settings.fullscreen,1]) window_set_fullscreen(true)

	menu[settings.squashStretch,0] = "Squash 'n Stretch"
	menu[settings.squashStretch,1] = ini_read_real("config","squashNstretch",true)

	menu[settings.sizeCap,0] = "Size Cap"
	menu[settings.sizeCap,1] = ini_read_real("config","sizeCap",true)

	menu[settings.textSpeed,0] = "Text Speed"
	menu[settings.textSpeed,1] = ini_read_real("config","textDelay",1)
	menu[settings.textSpeed,1] = clamp(menu[settings.textSpeed,1],1,3)
	function updateTextSpeed(){
		switch menu[settings.textSpeed,1] {
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

	menu[settings.back,0] = "Back"
	
	if(room=rTitle || room=rTally){
		menu[settings.quit,0] = "Quit"
		menu[settings.quit,1] = 0
	} else {
		menu[settings.quit,0] = "End Run"
		menu[settings.quit,1] = 1
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