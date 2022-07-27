//genShop();

//teWeight stored in oPlayer
function teDraw() {
	with(oPlayer){
		
	var i = array_length(teWeight)
	var total = 0
	//var dbg = ""
	
	while(i>0) {
		i--
		total+=teWeight[i]
	}
	
	var rand = random(total)
	i = array_length(teWeight)
	//dbg = dbg+"Roll of "+string(rand)+"/"+string(total)+". "
	while(rand>0){
		i--
		rand-=teWeight[i]	
	}
	//dbg = dbg+"Returning "+string(i)
	//show_debug_message(dbg)
	
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
	case 2: //Not Done
	return(genEvRare)
	break;
	case 3:
	return(genEvCave)
	break;
} }


option = [teDraw(),0]
while(option[0]=option[1]) option[1] = teDraw()

oPlayer.tranRoom = rEvent;
image_alpha = 0

if(!progCheck("tChoiceTutorial")) oCamera.yOffset = 100
else oCamera.yOffset = 0

setShopWidth()
fastMode = false;

sinCount = 0
sinOut = 0