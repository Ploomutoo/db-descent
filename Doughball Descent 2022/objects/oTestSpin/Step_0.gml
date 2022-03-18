if(sinCount<=sinCap) {
	sinCount += sinSpeed
	sinSpeed = max(sinSpeed*0.99,2)
	if(sinCount>sinCap) sinCount = sinCap
	
	image_xscale = dsin(-sinCount)
	if(image_xscale>0) image_index = 0
	else image_index = 1
}