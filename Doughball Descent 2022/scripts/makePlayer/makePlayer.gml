function makePlayer()
{
	var player = instance_create_layer(320,-96,"instances",oPlayer)
	var _char  = playerChars[chosenChar]
	with(player) 
	{
		altarInstantiate()
		var path = working_directory+"PlayerSprites/"+_char+"/"
		show_debug_message(path)
		ini_open(path+"char.ini")
			
		var stagesArr = commasToArray(ini_read_string("Global","Visualthresholds",
		"0,100,200,300,400,600,800,1000,1200"))
		var weightstagesArr = commasToArray(ini_read_string("Global","Weightthresholds",
		"0,100,200,400,600,800,1200"))
		weightCategories.threshold = weightstagesArr
		weightCategories.spriteStageInc = stagesArr
		
		var stages = array_length(stagesArr)
		weightCategories.stageCount = stages
		var weightstages = array_length(weightstagesArr)
		
		var originBase		= [ini_read_real("Base","OffsetX",23),ini_read_real("Base","OffsetY",46)]
		var originBump		= [ini_read_real("Bump","OffsetX",25),ini_read_real("Bump","OffsetY",46)]
		var originSwim		= [ini_read_real("Swim","OffsetX",25),ini_read_real("Swim","OffsetY",46)]
		var originDead		= [ini_read_real("Dead","OffsetX",25),ini_read_real("Dead","OffsetY",28)]
		
		playerSprites = 
		{
			stages,
			
			base :		sprite_add(path+"idle_base.png",
			stages,0,0,
			originBase[0],originBase[1]),
			
			jiggle :	sprite_add(path+"idle_jiggle.png",
			stages,0,0,
			originBase[0],originBase[1]),
			
			bump :		sprite_add(path+"bump.png",
			stages,0,0,
			originBump[0],originBump[1]),
			
			swim :		sprite_add(path+"swim.png",
			stages,0,0,
			originSwim[0],originSwim[1]),
			
			dead :		sprite_add(path+"dead.png",
			stages,0,0,
			originDead[0],originDead[1]),
		}
		
		weightCategories.spriteNum = stages
		weightCategories.minweight = ini_read_real("Global","Minweight",50)
		weight = ini_read_real("Global","Startweight",100)
			
		switch(_char)
		{
			case "Dewey":
			case "Chunk":
			funcBashinit = bashinitDewey
			funcBash = bashDewey
			funcBashend = bashendDewey
			break;
			
			case "Choux":
			funcBashinit = bashinitChoux
			funcBash = bashChoux
			funcBashend = bashendChoux
			playerSprites.puffbash = sprite_add(path+"puffbash.png",
			ini_read_real("Puffbash","Frames",6),0,0,
			ini_read_real("Puffbash","OffsetX",48),ini_read_real("Puffbash","OffsetY",48))
			break;
			
			case "Calorie":
			funcBashinit = bashinitDewey
			funcBash = bashDewey
			funcBashend = bashendDewey
			poweredFlight = true
			playerSprites.flight = sprite_add(path+"jetpack.png",
			stages,0,0,originSwim[0],originSwim[1])
			break;
			
			default:
			funcBashinit = bashinitKatsuma
			funcBash = bashKatsuma
			funcBashend = bashendKatsuma
			break;
		}
		
		if(!sprite_exists(playerSprites.base))		{ playerSprites.base = sPlayerJiggleBase; show_debug_message("Player sprite fallback!") }
		if(!sprite_exists(playerSprites.jiggle))	playerSprites.jiggle = sPlayerJiggle
		if(!sprite_exists(playerSprites.bump))		playerSprites.bump = sPlayerBump
		if(!sprite_exists(playerSprites.swim))		playerSprites.swim = sPlayerSwim
		if(!sprite_exists(playerSprites.dead))		playerSprites.dead = sPlayerCorpse
		
		ini_close()
	}
}