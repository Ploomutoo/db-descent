if(!onDestroy) exit;
createParticles(x,y,6,sPaMeat)
spawnCorpse()

var carnStacks = instance_number(oiCarnivore)
if(carnStacks>0 && irandom(99)<=carnStacks*5){
	with(oPlayer) {
		var popup = instance_create_layer(x,y-46,layer,oPopupText)
		popup.drawString = "<3"
		
		soundRand(sndBloodlust)
		
		if(hearts<heartMax) hearts++
	}
}

soundRand(sndEnemDie)