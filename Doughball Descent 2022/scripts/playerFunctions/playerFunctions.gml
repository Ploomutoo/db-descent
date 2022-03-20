function tutorialPrompt(check,promptText){
	
	if (progReadAndDone(check)) {
	
		oTextBox.announce(0,promptText)
		audio_play_sound(sndTutorial,5,0)
		with(oTextBox) drawText = storedText
	}
}

function progCheck(check){
	
	ini_open("progress.ini")
	
	var out = ini_read_real("general",check,devMode)
	ini_close()
	return(out)
}
function progSet(check,set){
	
	ini_open("progress.ini")
	
	ini_write_real("general",check,set)
	ini_close()
}
function progReadAndDone(check){
	
	ini_open("progress.ini")
	
	var out = false
	if(!ini_read_real("general",check,devMode)){
		
		ini_write_real("general",check,true);
		out = true;
	}
	
	ini_close()
	return(out)
}


function takeDamage(){
	
	if(iframes>0 || cheat) exit
	
	#region Kevlard
	var klStacks = instance_number(oiKevlard)
	var damNegate = 0
	var roll = 1
	
	if(klStacks>0) {
		damNegate+=min(weight,500)/20
		klStacks--
		while(klStacks>0){
			damNegate+=min(weight,500)/100
			klStacks-=1
		}
		var roll = irandom(99)
		//show_debug_message("Rolled "+string(roll)+" against "+string(damNegate))
	}
	#endregion
	
	if(roll<=damNegate){
		var popup = instance_create_layer(x,y-32,layer,oPopupText)
		popup.drawString = "NEGATED"
		soundRand(sndKevlard)
	} else {
		oCamera.screenShake = 4
		if(soulHearts>0){
			soulHearts--
			soundRand(sndHurtSoul)
		} else {
			hearts--
			soundRand(sndHurt)
		}
	}
	iframes = 60	
	
	if(hearts<=0){
		dead = true;
		speed = 0
		createParticles(x,y-16,12,sPaMeat)
		instance_create_layer(0,0,layer,oPopupDeath)
		alarm[0] = room_speed*3
		var corpse = instance_create_layer(x,y,layer,oEnemyCorpse)
		corpse.direction = direction
		corpse.speed = 4
		corpse.vspeed-=3
		corpse.sprite_index = sPlayerCorpse
		//corpse.color = global.playerCol
		corpse.image_index = spritePart+1
		corpse.image_xscale = girth*hFace
		corpse.gravity = 0.3	
	}
	
	speed = clamp(speed,-maxSpeed,maxSpeed)
	freezeFrame(3);
	
}
function freezeFrame(frames){
	with(oPause) {
	
	  autoPause = frames;
	  event_user(1);
	  
	}	
}

function playerKill(enemy){
	
	if(enemy.calories=0) exit;
	
	with(oPlayer) {
		
		var calGet = calBonus(enemy.calories)
		weight+= calGet
		
		oTally.calGot+=enemy.calories
		var popup = instance_create_layer(enemy.x,enemy.y-32,layer,oPopupText)
		popup.drawString = "+"+string(calGet)
		
		with(oComboMeter) event_user(0)

	}
	
	//freezeFrame(3);
	
}

function calBonus(calIn){
	
	if(calIn=0) return(0)
	
	var goldGut = instance_number(oiGoldenGut)
	calIn+=goldGut*calIn/5

	var stressEater = instance_number(oiStressEater)
	var heartLeft = hearts/heartMax
	while(stressEater>0){
		calIn += round(0.5*calIn*(1-heartLeft))
		stressEater--	
	}
	
	if(reboundStacks>0){
		var threshold = 100 + reboundStacks*100
		
		show_debug_message("Multiplier: "+string((weight-50)/(threshold-50)))
		var multiplier = clamp(lerp(1.5,1, (weight-50)/(threshold-50)),1,1.5);
		
		show_debug_message("Multiplier: "+string(multiplier))
		calIn =  calIn * multiplier
	}
	
	if(instance_exists(oComboMeter)){
		calIn = calIn * (1 + oComboMeter.combo/10)
	}
	
	return(ceil(calIn))
}