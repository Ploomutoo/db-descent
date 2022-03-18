audio_play_sound(sndMenuNext,0,0)
if(screen = 0) {
	room_goto(rInstructions)
	screen++
} else {
	global.playerType = selection
	
	instance_destroy(oMusicController)
	audio_stop_sound(musLevel0)
	room_goto(rGame)
	instance_destroy()
}