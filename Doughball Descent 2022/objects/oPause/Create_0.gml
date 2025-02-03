//globalvar forceFreeze; forceFreeze = 0;
//control S to reset

globalvar currentMusic; currentMusic = musLevel0;
globalvar txtSpeed;
globalvar devMode; devMode = false;

if(devMode) if(file_exists("progress.ini")) file_delete("progress.ini");

autoPause = 0;
paused = false;

mode =	"toplevel"
//		"settings"
//		"reallyrestart"
//		"reallyquit"

enum en_menu_mode
{
	top,
	settings,
	promptRestart,
	promptQuit
}
menu_main = ["Back","Settings","Restart","End Run"]
current_menu_size = array_length(menu_main)-1;

enum enSettings 
{
	masterVol,
	musicVol,
	screenShake,
	fullscreen,
	squashStretch,
	sizeCap,
	textSpeed,
	back
}
function settingsReset() {
	
	ini_open("config.ini")
	
	settings[enSettings.masterVol,0] = "Master Volume"
	settings[enSettings.masterVol,1] = ini_read_real("config","volumeMaster",5)
	audio_set_master_gain(0,settings[0,1]/10)

	settings[enSettings.musicVol,0] = "Music Volume"
	settings[enSettings.musicVol,1] = ini_read_real("config","volumeMusic",3)
	audio_group_set_gain(agMusic,settings[1,1]/10,0)

	settings[enSettings.screenShake,0] = "Screen Shake"
	settings[enSettings.screenShake,1] = ini_read_real("config","screenshake",5)

	settings[enSettings.fullscreen,0] = "Fullscreen"
	settings[enSettings.fullscreen,1] = ini_read_real("config","fullscreen",false)
	if(settings[enSettings.fullscreen,1]) window_set_fullscreen(true)

	settings[enSettings.squashStretch,0] = "Squash 'n Stretch"
	settings[enSettings.squashStretch,1] = ini_read_real("config","squashNstretch",true)

	settings[enSettings.sizeCap,0] = "Size Cap"
	settings[enSettings.sizeCap,1] = ini_read_real("config","sizeCap",true)

	settings[enSettings.textSpeed,0] = "Text Speed"
	settings[enSettings.textSpeed,1] = ini_read_real("config","textDelay",1)
	settings[enSettings.textSpeed,1] = clamp(settings[enSettings.textSpeed,1],1,3)
	function updateTextSpeed(){
		switch settings[enSettings.textSpeed,1] {
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

	settings[enSettings.back,0] = "Back"
	ini_close()
}

settingsReset();
playMusic(musLevel0);

cursorOn = 0
deactList = ds_list_create()