if(oTextBox.storedText != "") {
	
	if(oTextBox.storedText = oTextBox.drawText && ds_list_size(oTextBox.storedPage)=0)	oPlayer.mobile = true;
	exit;
	
} else {
	
	if(distance_to_object(oPlayer)>32) exit;
	oPlayer.mobile = false;
}


#macro cancelIfLinePresent if(oTextBox.storedText != "") exit;

oTextBox.voice = voice
//oTextBox.announce(0,choose("Greetings, squirt","Welcome, valued customer","'Sup, tubster","Hello again, Dewey")+". "+choose("Nice gut, it'd look better\n on me though","I was like you once\nBut I traded my legs for arms","Be careful out there","Stay a while, will ya?"))

var text = "Take your time, I have\nnowhere to be but here"
if(ds_list_size(linePool)>0) {
	
	ds_list_shuffle(linePool)
	
	text = linePool[|0]
	ds_list_delete(linePool,0)
}
oTextBox.announce(0,text)