if(instance_exists(oTerrainMaster))
{
	text = string(oTerrainMaster.area) + "-" + string((level-1)%3+1)
	if(loop>0) text += " L" + string(loop)
	
	if(oTerrainMaster.area = 6)
	{
		text = "ANUBIS"	
	}
}