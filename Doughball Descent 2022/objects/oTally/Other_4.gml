if(room=rGame){
	levelsGone++
	if(instance_exists(oTerrainMaster)) 
	{
		var _area = oTerrainMaster.area
		
		
		if(_area > steamFurthest) 
		{	
			steamFurthest = _area
			steam_set_stat_int("furthest_zone",steamFurthest)
		}
		
		switch(_area)
		{		
			case 2:
			if(!steam_get_achievement("Bready or Not!")) steam_set_achievement("Bready or Not!")
			break;
			
			case 3:
			if(!steam_get_achievement("Beat your Greens!")) steam_set_achievement("Beat your Greens!")
			break;
			
			case 4:
			if(!steam_get_achievement("Cheesed to Meet You!")) steam_set_achievement("Cheesed to Meet You!")	
			break;
			
			case 5:
			if(!steam_get_achievement("Protein Pro!")) steam_set_achievement("Protein Pro!")	
			break;
			
			case 6:
			if(!steam_get_achievement("Just Desserts!")) steam_set_achievement("Just Desserts!")	
			break;
		}
	}
} 
