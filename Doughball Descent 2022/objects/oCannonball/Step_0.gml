if(state=0){
	y-=3
	if(y<yTo) {
		y = oPlayer.y-250
		state = 1
		harmful = true
		soundRand(sndFall)
		layer = layer_get_id("instances")
		image_index = 1
		depth-=2
	}
} else {
	y+=5
	if(y>oPlayer.y+300) instance_destroy()
}