function altarInstantiate(){
	altarProtection = 0
	altarPlenty = 0
	altarBravery = 0
	altarStability = 0
	altarSafety = 0
}

function getAltarVar(altarInd){
	// 0-Protection, Plenty, 2-Safety, Stability, 4-Bravery
	switch(altarInd){
		case 0: return(oPlayer.altarProtection); break;
		case 1: return(oPlayer.altarPlenty); break;
		case 2: return(oPlayer.altarSafety); break;
		case 3: return(oPlayer.altarStability); break;
		case 4: return(oPlayer.altarBravery); break;
	}
}
function incAltarVar(altarInd){
	switch(altarInd){
		case 0: oPlayer.altarProtection++; break;
		case 1: oPlayer.altarPlenty++; break;
		case 2: oPlayer.altarSafety++; break;
		case 3: oPlayer.altarStability++; break;
		case 4: oPlayer.altarBravery++; break;
	}
}
function getAltarName(altarInd){
	switch(altarInd){
		case 0: return("Protection\nMore Hearts!"); break;
		case 1: return("Plenty\nMore Food!"); break;
		case 2: return("Safety\nFewer Traps!"); break;
		case 3: return("Stability\nTougher Tiles!"); break;
		case 4: return("Bravery\nMore Vaults!"); break;
	}
}