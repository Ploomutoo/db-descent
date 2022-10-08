//teWeight stored in oPlayer
function teDraw() {
	with(oPlayer){
		
	var i = array_length(teWeight)
	var total = 0
	
	while(i>0) {
		i--
		total+=teWeight[i]
	}
	
	var rand = random(total)
	i = array_length(teWeight)
	while(rand>0){
		i--
		rand-=teWeight[i]	
	}
	
	return(i)
	}
}

function teScript(teIndex) {
switch(teIndex) {
	
	case 0:
	return(genShop)
	break;
	case 1:
	return(genEvCave)
	break;
	case 2: 
	return(genEvRare)
	break;
	case 3:
	return(genEvCave)
	break;
} }

option = teDraw()
fastMode = false;

sinCount = 0
sinOut = 0