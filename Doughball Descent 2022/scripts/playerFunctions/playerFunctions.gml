function tutorialPrompt(check,promptText){
	
	if (progReadAndDone(check)) {
	
		oTextBox.announce(0,promptText)
		audio_play_sound(sndTutorial,5,0)
		with(oTextBox) {
			
			drawText = storedText
			box = false
			tmExpire = room_speed*1.2
		}
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
	//if argument, apply nonlethal
	
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
		if(argument_count>0 && argument[0]=1) {
			
			hearts = 1;
		} else {
			
			dead = true;
			speed = 0
			createParticles(x,y-16,12,sPaMeat)
			instance_create_layer(0,0,layer,oPopupDeath)
			alarm[0] = room_speed*3
		
			var corpse = instance_create_layer(x,y,layer,oEnemyCorpse);
			corpse.direction = direction; corpse.speed = 4; corpse.vspeed-=3;
			corpse.sprite_index = sPlayerCorpse; corpse.image_index = spritePart+1
			corpse.image_xscale = girth*hFace; corpse.gravity = 0.3;
			freezeFrame(8);
		}
	} else 
	{
		freezeFrame(3);
	}
	
	speed = clamp(speed,-maxSpeed,maxSpeed)
	
	
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
	
	// Golden Gut
	if(instance_exists(oiGoldenGut)) calIn+=oiGoldenGut.stacks*calIn/5
		

	var stressEater = 0;
	if(instance_exists(oiStressEater)) stressEater = oiStressEater.stacks;
	var heartLeft = hearts/heartMax
	while(stressEater>0){
		calIn += round(0.5*calIn*(1-heartLeft))
		stressEater--	
	}
	
	// Rebound Gains
	if(instance_exists(oiReboundGains))	calIn = oiReboundGains.foodGet(calIn);
	
	
	if(instance_exists(oComboMeter)){
		calIn = calIn * (1 + oComboMeter.combo/10)
	}
	
	return(ceil(calIn))
}
