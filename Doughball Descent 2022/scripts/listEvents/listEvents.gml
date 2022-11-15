#macro evMinChance 0.1

function pickEvent(){
	script_execute(choose(
	eventTightCave,
	eventCrackedRock,
	eventTemple,
	eventThornbush,
	eventRest,
	eventTrader,
	eventShrooms
	));
}

function pickEventRare(){
	script_execute(choose(
	rareEvBlompo,
	rareEvMirin
	));
}
