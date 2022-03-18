if(letterAddTimer=0) {
		
	if(string_length(drawText)<string_length(storedText)) {
		
		var ch = string_char_at(storedText,1+string_length(drawText))
		drawText += ch
		
		letterAddTimer = txtSpeed
		if(ch != " ") {
			audio_stop_sound(voice)
			var talkSound  = audio_play_sound(voice,-1,0)
			audio_sound_pitch(talkSound,pitch)
		} else if !monotone pitch = random_range(0.9,1.1)
		
	} else letterAddTimer = -1
	
} else letterAddTimer--