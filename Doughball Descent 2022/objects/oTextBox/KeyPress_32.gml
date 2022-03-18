if(string_length(drawText)<string_length(storedText)) {
	
	if(drawText != "") drawText = storedText
} else if (storedText != "") {

	if(ds_list_size(storedPage)>0) {
		
		storedText = storedPage[|0]
		ds_list_delete(storedPage,0)	
		event_user(0)
		
	} else {
		
		voice = talkGeneric
		storedText = ""
		drawText = ""
	}
}