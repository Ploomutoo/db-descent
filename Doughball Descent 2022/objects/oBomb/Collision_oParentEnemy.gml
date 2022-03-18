if(image_index>16){
	with(other){
		onDestroy=false;
		oPlayer.weight+=calories*2
		
		if(calories>0) createParticles(x,y,18,sPaMeat)

		soundRand(sndEnemDie)
		instance_destroy()
	}
}