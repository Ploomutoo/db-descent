//Beat Timer
var aPosGet = audio_sound_get_track_position(global.musCurrent)

if(aPosGet > beatNext) {
	aPos = 0
	
	aPosGet = floor(aPosGet/beatInterval)*beatInterval
	beatNext = aPosGet + beatInterval
	
	//show_debug_message("Title theme at "+string(aPosGet)+"s. Next beat at "+string(beatNext)+"s");
}

// Anim
aOut = animcurve_channel_evaluate(aChannel,aPos)
aPos += 0.05

aOut = 1 - aOut/10

// Cam
//var pm = matrix_build_projection_ortho(camWidth*aOutput,camHeight*aOutput,1,3200);
//camera_set_proj_mat(camera,pm);
