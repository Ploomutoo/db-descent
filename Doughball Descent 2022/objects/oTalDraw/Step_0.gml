if(cRightPressed) {
	sinCount = 0
	sinCap = 180
	sinSpeed = 10
	spinTo = image_index+1
	if(spinTo>=image_number) spinTo = 0
}

if(cLeftPressed) {
	sinCount = 0
	sinCap = 180
	sinSpeed = 10
	spinTo = image_index-1
	if(spinTo<0) spinTo = image_number-1
}

if(sinCount<=sinCap) {
	sinCount += sinSpeed
	sinSpeed = max(sinSpeed*0.99,2)
	if(sinCount>sinCap) sinCount = sinCap
	
	spinScale = dcos(sinCount)

	if(image_index!=spinTo) {
		if(sinCount>=sinCap/2) image_index = spinTo;
	} else spinScale = -spinScale
}