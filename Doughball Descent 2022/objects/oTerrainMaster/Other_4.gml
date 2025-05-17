#region Euclidian
with(oParentTileObject) {
	
	if(object_index = oHazGravel) image_index = oTerrainMaster.area-1
	
	if(tilemap_get_at_pixel(tileMap,x,y)!=4){
		onDestroy = false
		instance_destroy();
	}
}
with(oItemPedestal) {
	tilemap_set_at_pixel(tileMap,0,x,y-36)
	tilemap_set_at_pixel(tileMap,0,x,y-4)
	tilemap_set_at_pixel(tileMap,3,x+1,y+1)
}

with(oHazSpike) {

	if(tilemap_get_at_pixel(tileMap,x,y-16)!=0 || tilemap_get_at_pixel(tileMap,x,y+16)!=3)
	{
		onDestroy = false
		instance_destroy();
	}
	else
	{
		sprite_index = asset_get_index("sSpike"+string(oTerrainMaster.area))
		if(sprite_index=-1) sprite_index = asset_get_index("sSpike"+string(irandom_range(1,5)))
	}
}

with(oBouncyBlock)
{
	image_index = other.area-1
}

with(oHazBouncy) {
	image_index = oTerrainMaster.area-1
	if(tilemap_get_at_pixel(tileMap,x,y+16)=0 || tilemap_get_at_pixel(tileMap,x,y-16)>0){
		onDestroy = false
		instance_destroy();
	}
}


with(oFood) {
	image_index+=4*(oTerrainMaster.area-1)
	if(tilemap_get_at_pixel(tileMap,x,y)=3){
		onDestroy = false
		instance_destroy();
	}
}

with(oiPizzaScale) {
	
	var i = instance_number(oFood)-1;
	//show_debug_message(string(i)+" food")
	while(i>=0) {
		
		if(i%10 < stacks) with(instance_find(oFood,i)){
			//show_debug_message("pizzafied")
			sprite_index = sFoodPizza
			calories = 12
			image_index = 0
		}
		
		i--
		
	}
}

with(oParentEnemy) 
{	
	//event_user(4);
	if(tilemap_get_at_pixel(tileMap,x,y-1)!=0) if(object_index!=oSaw && object_index!=oSawAlt) instance_expunge()
}
with(oSaw) if(tilemap_get_at_pixel(tileMap,x,y-1)=0) instance_expunge()

goombReplace = 1 - power(0.8,loop)
//show_debug_message("Loop " + string(loop))
//show_debug_message("Goomb Replace is " + string(goombReplace*100) + "%")

if(loop>0) with(oGoomba){
	if(random(1) <= oTerrainMaster.goombReplace){
		if(level = 2) instance_create_depth(x,y,depth,oDurSlug)
		else if (level = 4) instance_create_depth(x,y,depth,oParagoomba)
		instance_expunge()
	}
}

with(oBushman) if(tilemap_get_at_pixel(tileMap,x+20*image_xscale,y-1)!=0) {
		image_xscale=-image_xscale
		if(tilemap_get_at_pixel(tileMap,x+20*image_xscale,y-1)!=0){
			onDestroy = false
			instance_destroy();
		}
}

with(oHazBush) {
	if(tilemap_get_at_pixel(tileMap,x,y-16)!=0 || tilemap_get_at_pixel(tileMap,x,y+16)=0 || tilemap_get_at_pixel(tileMap,x,y+16)=4 || instance_position(x,y-4,oHazSpike)!=noone){
		onDestroy = false
		instance_destroy()
	}
}
	
with(oBagel) if( !tsSpanEmpty(y,x-32,x+32) ){
	onDestroy = false
	instance_destroy();
}

#endregion

#region Altars
trapKill = power(0.85,oPlayer.altarSafety)
trapTotal = 0
trapRemoved = 0

function trapCull(chance) {
	oTerrainMaster.trapTotal++
	if(random(1)>chance) { instance_destroy(); oTerrainMaster.trapRemoved++ }
}

with(oHazSpike) trapCull(oTerrainMaster.trapKill)
with(oHazHotSauce) trapCull(oTerrainMaster.trapKill)
with(oMilkSpiller) trapCull(oTerrainMaster.trapKill)
with(oSaw) trapCull(oTerrainMaster.trapKill)

gravKill = power(0.8,oPlayer.altarStability)
gravTotal = 0
gravRemoved = 0

function gravCull(chance) {
	oTerrainMaster.gravTotal ++
	if(random(1)>chance) { 
		instance_destroy();
		tilemap_set_at_pixel(tileMap,2,x,y)
		oTerrainMaster.gravRemoved++ 
	}
}

with(oHazGravel) gravCull(oTerrainMaster.gravKill)

audio_stop_sound(sndBreak)

if(altarDebug) {
	show_debug_message(string(oPlayer.altarSafety)+" Safety, "+string(100*trapRemoved/trapTotal)+"% of traps removed");
	show_debug_message(string(oPlayer.altarStability)+" Stability, "+string(100*gravRemoved/gravTotal)+"% of gravel removed");
}
#endregion

instance_destroy();