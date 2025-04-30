function loadLevelStructures(argument0)
{
	
	show_debug_message("Loading level "+string(argument0))
	var theme = ""
	var density = "standard"
	var out = [0,0]
	switch(argument0) 
	{

		#region area 1
		case 0:
			area = 1
			theme = "a1_basic";
		break;
		case 1:
			area = 1
			theme = choose("a2_basic","a2_bouncehouse")
		break;
		case 2:
			area = 1
			theme = choose("a3_basic","a2_bouncehouse")
		break;
		#endregion
		#region area 2
		case 3:
			area = 2
			theme = "b1_bouncehouse"; //temp
			
		break;
		case 4:
			area = 2
			hgInnit(70,100,hgVegWorm)
			hgInnit(40,60,hgGravel)
			
			hgInnit(120,240,hgBushManRight)
			hgInnit(120,240,hgBushManLeft)
		break;
		case 5:
			area = 2
			hgInnit(70,100,hgVegWorm)
			hgInnit(40,60,hgGravel)
			hgInnit(70,100,hgShooter)
			
			hgInnit(150,250,hgBushManRight)
			hgInnit(150,250,hgBushManLeft)
			hgInnit(100,150,hgSpikes)
		break;
		#endregion
		#region area 3
		
			case 6:
				area = 3
				theme= "c1_basic"
			break;
			case 7:
				area = 3
				hgInnit(40,60,hgGravel)
				hgInnit(90,130,hgUdder)
				hgInnit(90,130,hgSpikes)
				hgInnit(700,1000,hgPirate)
				hgInnit(90,180,hgMilkSpiller)
			break;
			case 8:
				area = 3
				hgInnit(20,40,hgGravel)
				hgInnit(60,80,hgUdder)
				hgInnit(90,130,hgSpikes)
				hgInnit(300,500,hgPirate)
				hgInnit(60,120,hgMilkSpiller)
			break;
			
		#endregion
		#region area 4
		
			case 9:
				area = 4
				hgInnit(20,40,hgGravel)
				hgInnit(20,40,hgSauce)
				hgInnit(60,120,hgHotdogCorridor)
				hgInnit(90,130,hgSpikes)
				hgInnit(200,350,hgMeatworm)
				hgInnit(300,400,hgFish)
				break;
				
			case 10: //Add Saws
					 //Increase Frequency of Sauce
					 //Decrease Frequency of Hotdogs, MeatWorms, Fish
				area = 4
				hgInnit(20,40,hgGravel)
				hgInnit(90,130,hgSpikes)
				
				hgInnit(10,25,hgSauce)
				hgInnit(100,150,hgSaw)
				
				hgInnit(180,300,hgMeatworm)
				hgInnit(200,350,hgFish)
				hgInnit(90,160,hgHotdogCorridor)
				
				break;
			case 11: //Increase Frequency of MeatWorms, Spikes
					 //Decrease Frequency of Saws
				area = 4
				hgInnit(20,40,hgGravel)
				hgInnit(90,130,hgSpikes)
				hgInnit(10,25,hgSauce)
				hgInnit(90,160,hgHotdogCorridor)
				hgInnit(200,350,hgFish)
				
				hgInnit(100,150,hgSaw)
				
				hgInnit(80,160,hgMeatworm)
				break;
			
		#endregion
		case 12:
			area = 5 //Area 1 and 2 Throwback
			hgInnit(15,40,hgGravel)
			hgInnit(90,130,hgSpikes)
			
			hgInnit(80,160,hgGummyWorm)
			
			hgInnit(60,120,hgBagel)
			hgInnit(100,200,hgEclair)
			hgInnit(100,200,hgGumballMan)
		break;
		case 13:
			area = 5 //Area 3 and 4 Throwback
			hgInnit(10,30,hgGravel)
			hgInnit(130,200,hgSpikes)
			
			hgInnit(50,100,hgGummyWorm)
			
			hgInnit(60,120,hgSauce)
			hgInnit(100,150,hgAxe)
			hgInnit(150,300,hgFish)
		break;
		case 14:
			area = 5
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
			
			//hgInnit(200,400,hgDragon)
			hgOnce(hgDragon)
			hgInnit(50,100,hgGummyWorm)
			
			hgInnit(200,400,hgBagel)
			hgInnit(300,600,hgEclair)
			hgInnit(300,600,hgGumballMan)
			hgInnit(30,60,hgSauce)
			hgInnit(200,400,hgAxe)
			hgInnit(300,600,hgFish)
		break;
		case 15:
			area = 6
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
	}
	
	
	switch(theme)
	{
		case "a1_basic":
		hgInnit(70,100,hgGoomba)
		hgInnit(20,40,hgGravel)
		hgInnit(90,130,hgSpikes)
		density = "standard"
		break;
		
		case "a2_basic":
		hgInnit(60,90,hgGoomba)
		hgInnit(40,60,hgGravel)
		hgInnit(60,90,hgBagel)
		hgInnit(90,130,hgSpikes)
		density = "dense"
		break;
		
		case "a3_basic":
		hgInnit(50,70,hgGoomba)
		hgInnit(20,40,hgGravel)
		hgInnit(70,100,hgBagel)
		hgInnit(60,90,hgSpikes)
		density = "ultradense"
		break;
		
		case "a2_bouncehouse":
		hgInnit(70,100,hgBigWorm)
		hgInnit(50,70 ,hgRay)
		hgInnit(20,40 ,hgBouncy)
		hgInnit(60,90,hgBagel)
		density = "sparse"
		break;
		
		case "b1_basic":
		hgInnit(70,100,hgVegWorm)
		hgInnit(40,60,hgGravel)
		hgInnit(80,120,hgShooter)
		hgInnit(2,10,hgBush)
		hgInnit(100,150,hgSpikes)
		density = "5050"
		
		break;
		
		case "b1_bouncehouse":
		hgInnit(100,120,hgVegWorm)
		hgInnit(60,80,hgGravel)
		hgInnit(80,120,hgShooter)
		
		hgOnce(hgCotw)
		hgInnit(100,150,hgSpikes)
		density = "sparse"
		break;
		
		case "c1_basic":
		hgInnit(20,40,hgGravel)
		hgInnit(70,100,hgUdder)
		hgInnit(90,130,hgSpikes)
		hgInnit(40,80,hgBounceBlock)
		hgInnit(60,120,hgMilkSpiller)
		hgInnit(100,140,hgMilkBlock)
		break;
	}
	
	switch(density)
	{
		case "sparse":
		out = [1,72]
		break;
		
		case "semisparse":
		out = [2,100]
		break;
		
		case "5050":
		out = [2,90]
		break;
		
		case "dense":
		out = [2,72]
		break;
		
		case "ultradense":
		out = [4,100]
		break;
		
		default: //"standard"
		out = [2,85]				
		break;
	}
	
	
	return(out)
	//out 0 is octave, out 1 is threshold
}