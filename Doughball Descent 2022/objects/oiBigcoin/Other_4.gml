if(room=rGame)
{
	for (var i = array_length(global.foodval)-1; i >= 0; i--)
	{
		global.foodval[i]+=choose(stacks,stacks,-stacks)	
	}
}