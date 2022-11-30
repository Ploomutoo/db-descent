//Beat Timer
var apTemp = audio_sound_get_track_position(global.musCurrent)
if(apTemp<aPosGet) beatNext = 0;
aPosGet = apTemp;

if(aPosGet > beatNext) {
	aPos = 0
	
	aPosGet = floor(aPosGet/beatInterval)*beatInterval
	beatNext = aPosGet + beatInterval
	
	//show_debug_message("Title theme at "+string(aPosGet)+"s. Next beat at "+string(beatNext)+"s");
	beatLoop++;
}

if(beatLoop<3 || aPosGet>17.5) {
	
	// Anim
	aOut = animcurve_channel_evaluate(aChannel,aPos)
	aPos += 0.05
	aOut = 1 - aOut/20
	
} else if(beatLoop>4) beatLoop = 1;	



// Cam
//var pm = matrix_build_projection_ortho(camWidth*aOutput,camHeight*aOutput,1,3200);
//camera_set_proj_mat(camera,pm);
