#macro evMinChance 0.1

function pickEvent(){
	script_execute(choose(
	//eventTightCave,
	//eventCrackedRock,
	//eventThornbush,
	//eventRest,
	eventTemple
	));
}

function pickEventRare(){
	script_execute(choose(
	rareEvMirin
	));
}
