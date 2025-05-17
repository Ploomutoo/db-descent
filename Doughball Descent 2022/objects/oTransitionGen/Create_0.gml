//teWeight stored in oPlayer
function teDraw() 
{
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
	
	var out = [genShop,0]
	switch(teIndex) 
	{
		case 0:
		out = [genShop,0]
		break;
		
		case 1:
		out = [genEvCave,0]
		break;
		
		case 2: 
		out = [genEvRare,0]
		break;
		
		case 3: //temple
		out = [genGeneric,"vsEventTempleExt"]
		break;
		
		case 4: //cornucopia
		out = [genGeneric,"vsCollectathon"]
		break;
		
		case 5: //campfire
		out = [genGeneric,"vsRestsite1"]
		//out = [genGeneric,"vsCollectathon"]
		break;
		
		case 6: //arena
		case 7: //easter egg
		out = [genGeneric,"vsEventTemple"]
		break;
	} 
	return(out)
}

option = [teDraw(),0]
while(option[0]=option[1]) option[1] = teDraw()

fastMode = false;

sinCount = 0
sinOut = 0

selectionWidth = dispWidth/array_length(option)