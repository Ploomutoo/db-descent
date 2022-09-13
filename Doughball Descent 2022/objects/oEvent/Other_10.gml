/// @description Bash Trigger

switch(state) {
	
	case -1:
	break;
	case 0:		
		if(abs(y-oPlayer.y)>2) exit;
		if(abs(x-oPlayer.x)>48) exit;
		cancelIfLinePresent
		
		oPlayer.mobile = false;
		
		oTextBox.voice = voice
		oTextBox.announce(0,event.txExposition)
		state++
	break;
	case 1:
		cancelIfLinePresent
		choice = 1
		state++
	break;
	case 2:
	
		oTextBox.voice = voice
		if(choice) {
		oTextBox.announce(0,event.txAttempt);
		state++;
		} else {
		oTextBox.announce(0,event.txDecline);
		state = 4;
		}
	break;
	case 3:
	
		cancelIfLinePresent
		oTextBox.voice = voice
		if(random(1)<=drawChance/100) {
			if(event.txSuccess != "") oTextBox.announce(0,event.txSuccess);
			event.success();
			audio_play_sound(sndEvent,10,0)
			
		} else {
			if(event.txFailure != "") oTextBox.announce(0,event.txFailure);
			event.failure();
			//audio_play_sound(sndEventBad,10,0)
		}
		state++
	break;
	
	case 4:
	
		cancelIfLinePresent
		oPlayer.mobile = true;
		state = -1;
		event.endFunc();
	break;
	
}
