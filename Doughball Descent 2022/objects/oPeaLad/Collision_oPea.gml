if(other.reflected) {
	
	soundRand(sndReflectKill)
	
	calories = calories*2
	
	instance_destroy(other)
	playerKill(self)
	instance_destroy()
	
}