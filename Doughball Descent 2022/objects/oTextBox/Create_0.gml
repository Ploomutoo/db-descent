function announce(monotoneVoice,text){
	
	with(oTextBox) {
		
		pitch = 1
		tmExpire = room_speed*0.7
		monotone = monotoneVoice
		box = true
		
		storedText = text
		ds_list_clear(storedPage)
		
		for(var i = 0; i<=string_length(storedText); i++){
			
			if (string_char_at(storedText,i) = ".") {

				storedPage[|ds_list_size(storedPage)] = string_copy(storedText,1,i-1)
				storedText = string_delete(storedText,1,i+1)
				i = 0
			} else if (i=string_length(storedText)) {
				
				storedPage[|ds_list_size(storedPage)] = string_copy(storedText,1,i)
				storedText = storedPage[|0]
				ds_list_delete(storedPage,0)
				break;
			}
		}
		soundRand(sndTextPick)
		event_user(0)
	}
}

storedText = ""
storedPage = ds_list_create()

drawWidth = 0
drawHeight = 0

avoice = talkGeneric
pitch = 1
monotone = true
box = true
tmExpire = -1

x = viewWidth/2
y = 16
event_user(0)