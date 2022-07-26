if(sprite_index = sDragon) {
	if (fireball = 1) {
	
		sprite_index = sDragon2
		fireball = 1
	}
	
} else if (sprite_index = sDragon2) {
	sprite_index = sDragon;
	
	//irandom(3)
	if(irandom(3)=0){
		fireball = -1
		//soundRand(sndDragonLaugh)
		show_debug_message("charge")
	} else {
		fireball = 100
	}
}