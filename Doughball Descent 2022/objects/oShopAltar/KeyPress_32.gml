var _indulgence = instance_find(oiIndulgence,0)
if(_indulgence != noone && _indulgence.indulgenceStacks > 0)
{
	_indulgence.indulgenceStacks--;
	
	var _offering = instance_find(oiOffering,0)
	if(_offering != noone)
	{
		oPlayer.hearts = min(oPlayer.heartMax,oPlayer.hearts+_offering.stacks)	
	}
		
	soundRand(sndAltarUse)
	incAltarVar(altarType)
}
else if(playerOn && price>0 && oPlayer.mobile) 
{
	if(oPlayer.weight>=price && oPlayer.weight>50)
	{
		oPlayer.weight-=price
		if(oPlayer.weight<50) oPlayer.weight = 50
		
		var _offering = instance_find(oiOffering,0)
		if(_offering != noone)
		{
			oPlayer.hearts = min(oPlayer.heartMax,oPlayer.hearts+_offering.stacks)	
		}
		
		soundRand(sndAltarUse)
		incAltarVar(altarType)
	}
}
event_user(1)