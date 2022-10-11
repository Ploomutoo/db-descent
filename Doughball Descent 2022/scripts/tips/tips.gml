function tip(){
	return(choose(
	"Spikes only deal damage if landed on",
	"Press Jump as you hit the ground to bounce off",
	"Rare Food tastes better",
	"Look before you leap",
	"You can reflect most projectiles with a belly bash",
	"You can't fall through blocks below 100lbs",
	"Reflected pea kills give a doubled reward",
	"Durable blocks halt your descent"
	))
}

function taglines(){
	
	//if(irandom(10)<6) return("");
	
	return(": "+choose(
	"98\% Milkfat",
	"Jiggly",
	"Look before you leap",
	"What the Hell is Mr. Driller",
	"Watch out for Heartburn",
	"Tribal Hunter? I hardly know her",
	"Thank you CreatureUnknown",
	"Shoutout to SimpleFlips",
	"No Vore"
	))
}
