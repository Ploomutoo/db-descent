#macro evMinChance 0.1

function pickEvent(){
	var eventArr = 
	[eventTightCave,
	eventCrackedRock,
	//eventTemple,
	eventThornbush,
	eventBat,
	eventFairyShrine]
	
	if(instance_exists(oBase)) array_push(eventArr,eventShrooms,eventTrader)
	
	//eventArr = []
	script_execute(eventArr[irandom(array_length(eventArr)-1)]);
}

function pickEventRare(){
	script_execute(choose(
	rareEvZev,
	rareEvBlompo,
	rareEvMirin
	));
}
