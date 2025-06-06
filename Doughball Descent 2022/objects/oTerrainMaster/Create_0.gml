tileMap = layer_tilemap_get_id("terrain")

loopMultiplier = 1
var i = loop
while (i>0){
	loopMultiplier = loopMultiplier*0.5
	i--
}

area = 0
hGen = 0
hgItems = 0

hGenOnce[0] = 0

var load = loadLevelStructures(level)
//load 0 is octave, load 1 is threshold

if(area!=0) setAreaCosmetics(area)

#region zoneUnlock

	ini_open("config.ini")
	if(area-1>ini_read_real("general","zoneUnlock", 2)) {
	
		ini_write_real("general","zoneUnlock",area-1)
		oTextBox.announce(0,"Shortcut Permanently Unlocked")
		audio_play_sound(sndTutorial,5,0)
		with(oTextBox) drawText = storedText
	}
	ini_close();
	
#endregion

#region Base Terrain

ix = 0;
iy = 4;

xLimit = tilemap_get_width(tileMap)
yLimit = ceil(room_height/32) //tilemap_get_height(tileMap)
tilemap_set_height(tileMap,yLimit)

var plentyMult= power(0.8,oPlayer.altarPlenty)
var foodCountdown = round(plentyMult*irandom_range(12,18))
var foodPlaced = 0

var protMult = power(0.8,oPlayer.altarProtection)
var heartCountdown = round(protMult*irandom_range(64,xLimit*yLimit/3))
//xLimit*yLimit/3+irandom(xLimit*yLimit/2))
var heartPlaced = 0

var invertLayer = 1+irandom(3)
var noiseOut = 0
var place = 0
var noiseSeed = [irandom(255),irandom(255)]

var noiseThreshold = load[1]

var placeItem = irandom_range(1,3);

while(iy<yLimit){
	
	while(ix<xLimit) {
		
		noiseOut = noise(floor(ix/load[2])+noiseSeed[0],floor(iy/load[3])+noiseSeed[1],load[0])
		if(noiseOut>noiseThreshold) place = 1
		else place = 0
				
		tilemap_set(tileMap, place, ix, iy)
		
		if(place = 0)
		{
			if(foodCountdown<=0)
			{
				instance_create_layer(ix*32+16,iy*32+16,layer,oFood)
				foodPlaced++
				foodCountdown = round(plentyMult*irandom_range(12,18))
			} 
			else foodCountdown--
		
			if(heartCountdown<=0){
				
					heartPlaced++
					if(placeItem = 0 && irandom(1)=0) {
						instance_create_layer(ix*32,iy*32,layer,oItemPedestal)
					} else {
						instance_create_layer(ix*32,iy*32,layer,oHeartPickup)
						placeItem--;
					}
					heartCountdown = round(protMult*irandom_range(xLimit*yLimit/2,xLimit*yLimit/3))
			} else heartCountdown--
		}
		ix++
	}
	ix = 0;
	iy++
	
	if(invertLayer<=0){
		
		if(place0 = 0) {
			place0 = 1
			place1 = 0
		} else {
			place0 = 0
			place1 = 1
		}
		invertLayer = irandom(density)
		
	}
	
}
#endregion
#region Place once items
	for(var i = array_length(hGenOnce)-1; i>0; i--)
	{
		hGenOnce[i]();
	}
#endregion
#region Algorithmic Hazards

//Pass 2
ix = 0
iy = 5

while(iy<yLimit){
	while(ix<xLimit) {
		var hgiCounter = 0
		while(hgiCounter<hgItems) {
			hgIncrement(hgiCounter)
			hgiCounter++
		}
		ix++
		
	}
	ix = 0
	iy++
}
#endregion
#region Vaults

vcLower = 20 + (80/(oPlayer.altarBravery+1))
vcUpper = 40 + (120/(oPlayer.altarBravery+1))

room_pack_blank_object = oRoompackBlank

var json_rooms_area = script_execute(asset_get_index("vaultdata"+string(area)))
//var json_rooms_area = script_execute(asset_get_index("vaultdataG"))
var json_rooms_g = script_execute(asset_get_index("vaultdataG"))

var genericVault = false

var vaultCooldown = irandom_range(vcLower,vcUpper)
var vaultsPlaced = 0

vaultWidth = 8
vaultHeight = 8

ix = 0
iy = 7

var xOffset = 0
var xoReset = 0

// pick a random room name from the map:
	var name = ds_map_find_first(json_rooms_area);
	repeat (irandom_range(0, ds_map_size(json_rooms_area) - 1)) {
		name = ds_map_find_next(json_rooms_area, name);
	}
	vaultWidth = json_rooms_area[?name][?"roomSettings"][?"Width"]/32
	vaultHeight = json_rooms_area[?name][?"roomSettings"][?"Height"]/32
			
	//show_debug_message("Vault "+name+": "+string(vaultWidth)+" x "+string(vaultHeight))

while(iy<yLimit-vaultHeight){
	while(ix<xLimit-vaultWidth) {
		if(vaultCooldown<=0){
			vaultsPlaced++
			
			// and load that:
			if(!genericVault) room_pack_load_map(json_rooms_area[?name], ix*32, iy*32, room_pack_flag_instances);
			else room_pack_load_map(json_rooms_g[?name], ix*32, iy*32, room_pack_flag_instances);
			
			ix+=vaultWidth
			
			xOffset=ix
			xoReset = max(xoReset,vaultHeight)
			
			// pick a random room name from the map:
			if(irandom(3)=0){			
				name = ds_map_find_first(json_rooms_area);
				repeat (irandom_range(0, ds_map_size(json_rooms_area) - 1)) {
					name = ds_map_find_next(json_rooms_area, name);
				}
				vaultWidth = json_rooms_area[?name][?"roomSettings"][?"Width"]/32
				vaultHeight = json_rooms_area[?name][?"roomSettings"][?"Height"]/32
				genericVault = false
			} else {
				name = ds_map_find_first(json_rooms_g);
				repeat (irandom_range(0, ds_map_size(json_rooms_g) - 1)) {
					name = ds_map_find_next(json_rooms_g, name);
				}
				vaultWidth = json_rooms_g[?name][?"roomSettings"][?"Width"]/32
				vaultHeight = json_rooms_g[?name][?"roomSettings"][?"Height"]/32
				genericVault = true
			}
			
			vaultCooldown = irandom_range(vcLower,vcUpper)
			
		} else vaultCooldown--
		ix++
		
	}
	iy++
	xoReset--
	if(xoReset=0) xOffset = 0
	
	ix = xOffset
}
// and when you're done:
ds_map_destroy(json_rooms_area);
ds_map_destroy(json_rooms_g);

#endregion

oPlayer.levelText = string(area)+" - "+string(1+level mod 3)
show_debug_message("Levelgen took "+string(delta_time)+" microseconds")

if(altarDebug) {
	show_debug_message("\nAltar Efficacy Log")
	show_debug_message(string(oPlayer.altarPlenty) + " Plenty, " + string(100*foodPlaced/yLimit) + "% efficacy")
	show_debug_message(string(oPlayer.altarProtection) + " Protection; "+string(heartPlaced)+" Hearts")
	//show_debug_message("\nPlaced "+string(vaultsPlaced)+" vaults over " +string(room_height/32) + " tiles")
	show_debug_message(string(oPlayer.altarBravery) + " Bravery, " + string(100*vaultsPlaced/yLimit) + "% efficacy")
}
if(loop>0) oPlayer.levelText+=" L"+string(loop)