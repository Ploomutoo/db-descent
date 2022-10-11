function loadLevelStructures(argument0){
	show_debug_message("Loading level "+string(argument0))
	
	switch(argument0) {
		#region area 1
		case 0:
			area = 1
			hgInnit(70,100,hgGoomba)
			hgInnit(20,40,hgGravel)
			
			hgInnit(90,130,hgSpikes)
		break;
		case 1:
			area = 1
			hgInnit(60,90,hgGoomba)
			hgInnit(40,60,hgGravel)
			
			hgInnit(60,90,hgBagel)
			hgInnit(90,130,hgSpikes)
		break;
		case 2:
			area = 1
			hgInnit(50,70,hgGoomba)
			hgInnit(20,40,hgGravel)
			
			hgInnit(70,100,hgBagel)
			hgInnit(60,90,hgSpikes)
		break;
		#endregion
		#region area 2
		case 3:
			area = 2
			hgInnit(70,100,hgGoomba)
			hgInnit(40,60,hgGravel)
			hgInnit(80,120,hgShooter)
			
			hgInnit(2,10,hgBush)
			hgInnit(100,150,hgSpikes)
		break;
		case 4:
			area = 2
			hgInnit(70,100,hgGoomba)
			hgInnit(40,60,hgGravel)
			
			hgInnit(120,240,hgBushManRight)
			hgInnit(120,240,hgBushManLeft)
		break;
		case 5:
			area = 2
			hgInnit(70,100,hgGoomba)
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
				hgInnit(20,40,hgGravel)
				hgInnit(70,100,hgUdder)
				hgInnit(90,130,hgSpikes)
				hgInnit(60,120,hgMilkSpiller)
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
				hgInnit(60,100,hgSaw)
				
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
			
			hgInnit(200,400,hgDragon)
			hgInnit(50,100,hgGummyWorm)
			
			hgInnit(200,400,hgBagel)
			hgInnit(300,600,hgEclair)
			hgInnit(300,600,hgGumballMan)
			hgInnit(30,60,hgSauce)
			hgInnit(200,400,hgAxe)
			hgInnit(300,600,hgFish)
		break;
	}
}