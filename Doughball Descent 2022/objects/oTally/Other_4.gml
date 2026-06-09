if(room=rGame){
	levelsGone++
	if(instance_exists(oTerrainMaster)) 
	{
		var _area = oTerrainMaster.area
		
		if(global.steam && _area > steamFurthest) 
		{	
			steamFurthest = _area
			steam_set_stat_int("furthest_zone",steamFurthest)
		}
		
		if(global.steam) switch(_area)
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
		
		ini_open("progress.ini")
		switch(_area)
		{
			case 3:
			if(!ini_read_real("charUnlocks","Choux",0))
			{
				ini_write_real("charUnlocks","Choux",1)
				oTextBox.announce(0,"Unlocked Choux!")
			}
			break;
			case 4:
			if(!ini_read_real("charUnlocks","Chunk",0))
			{
				ini_write_real("charUnlocks","Chunk",1)
				oTextBox.announce(0,"Unlocked Chunk!")
			}
			break;
			case 5:
			if(!ini_read_real("charUnlocks","Calorie",0))
			{
				ini_write_real("charUnlocks","Calorie",1)
				oTextBox.announce(0,"Unlocked Calorie!")
			}
			break;
		}
		ini_close()
	}
} 
