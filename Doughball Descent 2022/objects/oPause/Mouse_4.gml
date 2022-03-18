global.music = !global.music

ini_open("config.ini")
ini_write_real("audio","musicEnabled",global.music)
ini_close()

if(!global.music){
	image_index = 1
	audio_stop_sound(musLevel0)
} else {
	image_index = 0
	audio_play_sound(musLevel0,-3,1)	
}