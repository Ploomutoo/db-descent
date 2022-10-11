function popUp(ix,iy,text){
	var popup = instance_create_depth(ix,iy,0,oPopupText)
	popup.drawString = text
	
}

function markPoint(ix,iy){
	instance_create_depth(ix,iy,depth,oPaEffect)
}

function addItem(item) {
	
	var tStacks = instance_number(item);
	if(tStacks>0) with(item) { stacks++; event_user(0); }
	else with(instance_create_depth(0,0,0,item)) {
		
		var iCount = array_length(oPlayer.items);
		
		oPlayer.items[iCount]=self;
		mountItem(iCount);

		stacks = 1;
		persistent=true;
		bought = true;
		event_user(0);
		
	}
}

function array_find_index(arr, val)
{
	for(var i = 0; i < array_length(arr); i++)
	{
		if(arr[i] = val)
		{
			return i;
		}
	}
	return -1;
}

function instance_expunge(){
	if(argument_count>0){
		with(argument[0]){
			//show_debug_message("expunging other")
			onDestroy = false;
			instance_destroy();
		}
	} else {
		onDestroy = false;
		instance_destroy();
	}
}

function goToTally(){
	
	audio_stop_all()
	currentMusic = musDeath
	playMusic(currentMusic)
	
	instance_activate_object(oTally)
	
	instance_destroy(oSidebarL)
	instance_destroy(oSidebarR)
	instance_destroy()
	
	room_goto(rTally)
}

function spawnCorpse(){
	var corpse = instance_create_depth(x,y,depth,oEnemyCorpse)
	corpse.direction = point_direction(oPlayer.x,oPlayer.y,x,y)
	corpse.speed = 4
	corpse.vspeed-=3
	corpse.sprite_index = sprite_index
	corpse.image_index = image_index
	corpse.gravity = 0.3	
}

function bgUpdate(argument0) {
	with(oCamera) {
		bgSprite = argument0

		bgX = sprite_get_width(bgSprite)
		bgY = sprite_get_height(bgSprite)

		bgTilesX = 1+ceil(viewWidth/bgX)
		bgTilesY = 1+ceil(viewHeight/bgY)
	}
}

function soundRand(argument0) {
	audio_stop_sound(argument0)
	audio_sound_pitch(argument0,1+random_range(-0.2,0.2))
	audio_play_sound(argument0,0,0)
}

function soundDist(sound,fullVol,noVol) {
	//audio_stop_sound(sound)
	var gain = audio_sound_get_gain(sound)
	var dist = distance_to_object(oPlayer)
	
		if(dist<fullVol) gain = gain
		else if(dist<noVol) {
			gain = gain*(1-(dist-fullVol)/(noVol-fullVol))
		} else return;
	
	//show_debug_message("Volume "+string(gain)+", Distance "+string(dist))
	var play = audio_play_sound(sound,0,0)
	audio_sound_gain(play,gain,0)
	audio_sound_pitch(play,random_range(0.9,1.1))
}

function tRound(argument0,argument1){
	return(floor(argument0/argument1)*argument1)
}

enum blockReturn {
	
	nothing,
	deIncrement,
	setZero
}

function breakBlock() { //--!--!--!--!--!--
	
	//Argument 0 and 1: X and Y of tile
	//Argument 2: Accepts string:
			//"bash"
			//"breakInvuln"
			//"noBashdown"
	var rVal = blockReturn.nothing; //returned value
	
	if(argument_count<2) exit;
	if(argument_count>2) {
		var isBash = argument[2];	
	} else  isBash = false;
	
	switch(tilemap_get_at_pixel(tileMap,argument[0],argument[1])) {
		case 0: //Empty
		break;
		
		case 1: //Regular Tile
		case 6: //Damaged Durable Tile
			
			if(crushes>0 || isBash) {
				
				tilemap_set_at_pixel(tileMap,0,argument[0],argument[1])
				with(instance_position(tRound(argument[0],32)+16,tRound(argument[1],32)-16,oHazBush)) instance_destroy()
				//createParticles(argument[0],argument[1],6,sPaRock)
			
				//soundRand(sndBreak)
				audio_stop_sound(sndBreak)
				var pSound = audio_play_sound(sndBreak,0,0)
				if(!isBash) audio_sound_pitch(pSound,max(1-0.1*(crushes-crushMax),0.5))
				return(blockReturn.deIncrement)
			}
			
		break;
		case 2: //Durable Tile
		
			if(crushes>0 || isBash) {
			
				tilemap_set_at_pixel(tileMap,6,argument[0],argument[1])
				createEffect(floor(argument[0]/32)*32,floor(argument[1]/32)*32,sBlockHighlight)

				//if(y<argument[1]) crushes = 0
				//else bashActive = 10
			
				soundRand(sndTileDamage)
				return(blockReturn.setZero)
			}
		break;
		case 3: //Invulnerable Tile
			soundRand(sndTileInvulnerable)
			if(!isBash)	return(blockReturn.setZero);
			else bashActive = 10;
			
		break;
		case 4: //Function Tile
			
			with(instance_position(argument[0],argument[1],oParentTileObject)){

				event_user(0);
			}
		break;
	}
	
	return(blockReturn.nothing);
}

function breakLine(vy,vx1,vx2){
	///@arg y
	///@arg x1
	///@arg x2
	//show_debug_message("Breaking "+string(vx1)+", "+string(vy)+" to "+string(vx2)+", "+string(vy))
		
	//var width = ceil((abs(vx2-vx1))/32)-1
	
	var c1 = floor(vx1/32)
	var c2 = floor(vx2/32)
	
	var i = 1
	if(c2>c1) i  += c2-c1
	
	//show_debug_message("Break "+string(c1)+" to "+string(c2)+". Width of "+string(i))
	createParticles((vx1+vx2)/2,vy,6,sPaRock)
	
	var rVal = 0
	// 0 is no deincrement
	// 1 is deincrement by 1
	// 2 is set to 0
	while(i>0){
		
		i--
		var brokeBlock = breakBlock(vx1+32*(i),vy)
		if(brokeBlock > rVal) rVal = brokeBlock;

	}
	switch(rVal) {
		case blockReturn.nothing:
		break;
		case blockReturn.deIncrement:
		crushes--;
		break;
		case blockReturn.setZero:
		crushes = 0;
		break;
	}
}

function tsCheckEmpty(argument0,argument1) {
	if(tilemap_get_at_pixel(tileMap,argument0,argument1)>0) return(true)
	else return(false)
}
	
function tsSpanEmpty(argument0,argument1,argument2) {
	//Returns True if Span is Empty
	///@arg y
	///@arg startX
	///@arg endX
	//Check left
	if (tilemap_get_at_pixel(tileMap,argument1,argument0)>0) return(false)
	//Check right
	if (tilemap_get_at_pixel(tileMap,argument2,argument0)>0) return(false)
	var span = argument2-argument1
	span = ceil(span/32)-1

	while(span>0){
		if (tilemap_get_at_pixel(tileMap,argument1+32*span,argument0)>0) return(false)
		span--
	}
	
	return(true)
	
}

function createParticles(argument0,argument1,argument2,argument3) { 
	///@arg x
	///@arg y
	///@arg amount
	///@arg sprite
	var creation
	repeat(argument2){
		creation = instance_create_depth(argument0,argument1,depth-2,oParticle)
		creation.sprite_index = argument3
		
		if(argument3 = sPaRock) creation.drawCol = oSidebarR.colorA
		if(argument3 = sPaMeat) creation.drawCol = oSidebarR.colorB

		creation.speed = random(2)+2
		creation.direction = random(360)
	}
}
	
function createEffect(putX,putY,sprite){
	var effect = instance_create_depth(putX,putY,depth-1,oPaEffect)
	effect.sprite_index = sprite
	effect.image_index = 0
	
	return(effect)
}


function draw_text_outlined(argument0,argument1,argument2){
	///@arg x
	///@arg y
	///@arg text
	draw_set_color(c_black);
	draw_text(argument0+1,argument1,argument2);
	draw_text(argument0-1,argument1,argument2);
	draw_text(argument0,argument1+1,argument2);
	draw_text(argument0,argument1-1,argument2);
	draw_set_color(c_white);
	draw_text(argument0,argument1,argument2);
}

function pauseUnpause(){
	with(oPause) event_user(0)
}

function playMusic(track) {
	
	//show_debug_message("Called by "+object_get_name(object_index))
	
	if(oPause.menu[1,1]=0) { audio_group_stop_all(agMusic); global.musCurrent = 0; exit; }
	if(audio_is_playing(track)) exit;
	
	audio_group_stop_all(agMusic);
	
	currentMusic = track;
	global.musCurrent = audio_play_sound(track,-2,1);
	
	/*var musPrev = asset_get_index("musLevel"+string(trackNum-1))
	if(musPrev>=0) audio_stop_sound(musPrev)
	
	var musCurrent = asset_get_index("musLevel"+string(trackNum))
	audio_sound_gain(musCurrent,oPause.menu[1,1]/10,0) 
	if(musCurrent!=-1 && !audio_is_playing(musCurrent)) audio_play_sound(musCurrent,-5,1)*/

}