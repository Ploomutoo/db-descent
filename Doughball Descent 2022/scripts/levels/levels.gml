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
			theme = "a_intro";
		break;
		case 1:
			area = 1
			theme = choose(
			"a2_basic",
			"a_bouncehouse",
			"a_bigworm")
		break;
		case 2:
			area = 1
			theme = choose(
			"a3_basic",
			"a_bouncehouse",
			"a_bigworm")
		break;
		#endregion
		
		#region area 2
		case 3:
			area = 2
			theme = "b1_basic";
			
		break;
		case 4:
			area = 2
			theme = "b2_basic";
		break;
		case 5:
			area = 2
			theme = "b3_basic";
		break;
		
		#endregion
		
		#region area 3
		
			case 6:
				area = 3
				theme= "c1_basic"
			break;
			case 7:
				area = 3
				theme = "c2_basic"
			break;
			case 8:
				area = 3
				theme = "c3_basic"
			break;
			
		#endregion
		#region area 4
		
			case 9:
				area = 4
				theme = choose(
				"d1_basic",
				"d_wet"
				)
				break;
			case 10: 
				area = 4
				theme = choose(
				"d2_basic",
				"d_wet",
				"d_saws-n-dogs"
				)
				break;
			case 11: 
				area = 4
				theme = choose(
				"d3_basic",
				"d_saws-n-dogs"
				)
				break;
		#endregion
		#region area 5
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
		#endregion
		
		case 15: 
			area = 6
			hgOnce(hgAnubis)
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
	}
	
	
	switch(theme)
	{
		#region area 1
		
		case "a_intro":
		hgInnit(70,100,hgGoomba)
		hgInnit(150,300,hgBigWorm)
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
		
		case "a_bouncehouse":
		hgInnit(50,70 ,hgRay)
		hgInnit(20,40 ,hgBounceBlock)
		hgInnit(60,90,hgBagel)
		density = "sparse"
		break;
		case "a_bigworm":
		hgInnit(60,90,hgGoomba)
		hgInnit(70,100,hgBigWorm)
		hgInnit(60,90,hgBagel)
		hgInnit(60,90,hgSpikes)
		density = "5050"
		break;
		
		#endregion
		#region area 2 - veg
		
		case "b1_basic": 
			hgInnit(70,100,hgVegWorm)
			hgInnit(40,60,hgGravel)
			hgInnit(80,120,hgShooter)
			hgInnit(2,10,hgBush)
			hgInnit(100,150,hgSpikes)
			density = "5050"
		break;
		case "b2_basic":
			hgInnit(70,100,hgVegWorm)
			hgInnit(40,60,hgGravel)
			hgInnit(120,240,hgBushManRight)
			hgInnit(120,240,hgBushManLeft)
		break;
		case "b3_basic":
			hgInnit(70,100,hgVegWorm)
			hgInnit(40,60,hgGravel)
			hgInnit(70,100,hgShooter)
			
			hgInnit(150,250,hgBushManRight)
			hgInnit(150,250,hgBushManLeft)
			hgInnit(100,150,hgSpikes)
		break;
		
		case "b1_bouncehouse":
			hgInnit(100,120,hgVegWorm)
			hgInnit(60,80,hgGravel)
			hgInnit(80,120,hgShooter)
			hgOnce(hgCotw)
			hgInnit(100,150,hgSpikes)
			density = "sparse"
		break;
		#endregion
		#region area 3 - dairy
		
		case "c1_basic":
			hgInnit(20,40,hgGravel)
			hgInnit(70,100,hgUdder)
			hgInnit(90,130,hgSpikes)
			hgInnit(40,80,hgBounceBlock)
			hgInnit(60,120,hgMilkSpiller)
			hgInnit(100,140,hgMilkBlock)
		break;
		case "c2_basic":
			hgInnit(40,60,hgGravel)
			hgInnit(90,130,hgUdder)
			hgInnit(90,130,hgSpikes)
			hgInnit(700,1000,hgPirate)
			hgInnit(90,180,hgMilkSpiller)
		break;
		case "c3_basic":
			hgInnit(20,40,hgGravel)
			hgInnit(60,80,hgUdder)
			hgInnit(90,130,hgSpikes)
			hgInnit(300,500,hgPirate)
			hgInnit(60,120,hgMilkSpiller)
		break;		
		#endregion
		#region area 4 - meat
		case "d1_basic":
			hgInnit(20,40,hgGravel)
			hgInnit(20,40,hgSauce)
			hgInnit(60,120,hgHotdogCorridor)
			hgInnit(90,130,hgSpikes)
			hgInnit(200,350,hgMeatworm)
			hgInnit(300,400,hgFish)
			hgInnit(100,140,hgShaft)
		break;
		case "d2_basic":	//Add Saws
							//Increase Frequency of Sauce
							//Decrease Frequency of Hotdogs, MeatWorms, Fish
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
			hgInnit(10,25,hgSauce)
			hgInnit(100,150,hgSaw)
			hgInnit(180,300,hgMeatworm)
			hgInnit(200,350,hgFish)
			hgInnit(90,160,hgHotdogCorridor)
		
		break;
		case "d3_basic":	//Increase Frequency of MeatWorms, Spikes
							//Decrease Frequency of Saws
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
			hgInnit(10,25,hgSauce)
			hgInnit(90,160,hgHotdogCorridor)
			hgInnit(200,350,hgFish)
			hgInnit(100,150,hgSaw)
			hgInnit(80,160,hgMeatworm)
		break;
		case "d_wet":
			hgInnit(20,40,hgGravel)
			hgInnit(20,40,hgSauce)
			hgInnit(60,120,hgHotdogCorridor)
			hgInnit(90,130,hgSpikes)
			hgInnit(200,350,hgMeatworm)
			hgInnit(300,400,hgFish)
			hgInnit(100,140,hgMilkBlock)
			hgInnit(100,140,hgShaft)
			density = "tunnels"
		break;
		case "d_saws-n-dogs":
			hgInnit(20,40,hgGravel)
			hgInnit(90,130,hgSpikes)
			hgInnit(80,100,hgSaw)
			hgInnit(180,300,hgMeatworm)
			hgInnit(90,160,hgHotdogCorridor)
			density = "tunnels"
		break;
		#endregion
		#region area 5 - dessert
		
		#endregion
	}
	
	switch(density)
	{
		case "sparse":
		out = {
			octave : 1,
			threshold : 72,
			xscale : 1,
			yscale : 1,
			thresholdTough : -1
		}
		break;
		
		case "semisparse":
		out = {
			octave : 2,
			threshold : 100,
			xscale : 1,
			yscale : 1,
			thresholdTough : -1
		}
		break;
		
		case "5050":
		out = {
			octave : 2,
			threshold : 90,
			xscale : 1,
			yscale : 1,
			thresholdTough : -1
		}
		break;
		
		case "cityblocks":
		out = {
			octave : 2,
			threshold : 90,
			xscale : 2,
			yscale : 2,
			thresholdTough : -1
		}
		break;
		
		case "tunnels":
		out = {
			octave : 1,
			threshold : 60,
			xscale : 4,
			yscale : 1,
			thresholdTough : 80
		}
		break;
		
		case "chutes":
		out = {
			octave : 1,
			threshold : 60,
			xscale : 1,
			yscale : 4,
			thresholdTough : 80
		}
		break;
		
		case "dense":
		out = {
			octave : 2,
			threshold : 72,
			xscale : 1,
			yscale : 1,
			thresholdTough : 96
		}
		break;
		
		case "ultradense":
		out = {
			octave : 4,
			threshold : 100,
			xscale : 1,
			yscale : 1,
			thresholdTough : 120
		}
		break;
		
		default: //"standard"
		out = {
			octave : 2,
			threshold : 85,
			xscale : 1,
			yscale : 1,
			thresholdTough : 100
		}
		break;
	}
	
	
	return(out)
	//out 0 is octave, out 1 is threshold, out 2 is xscale, out 3 is yscale, 4 is hard threshold
}