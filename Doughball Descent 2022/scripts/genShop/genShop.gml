function altarPick() {
	
	with(oShopkeeper) {
		
		if(ds_list_size(altarList) = 0) {
			show_debug_message("Altar List Depleted")
			return(5)
		}
		
		var i = irandom(ds_list_size(altarList)-1)
		var j = altarList[|i]
		ds_list_delete(altarList,i)
		return(j)
		
	}
	
	show_debug_message("Shopkeeper not found")
	
}

function setShopWidth(){ //Perform upon leaving a level
	
	var buffetStacks = 0;
	with(oiBuffet) buffetStacks = stacks;
	
	room_set_width(rEvent,2000+(buffetStacks*96));
	//show_debug_message("this script is actually called by "+object_get_name(object_index))
}

function genShop(){ //Perform in shop room
	
	tileMap = layer_tilemap_get_id("terrain")
	tilemap_set_width(tileMap,room_width)
	
	var json_rooms = vaultdataShop()

	ix = 5
	iy = 3
	
	var buffetStacks = 0;
	with(oiBuffet) buffetStacks = stacks;
	
	#region Section Gen
		
		//End L
		var name = "vsEndL"
		room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
		ix+=5
		
		// <3
		name = "vsShopHealth"
		repeat(irandom_range(1,3)){
			room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
			ix+=3
		}
		
		// Fall Area
		name = "vsFallArea"
		room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
		ix+=5
		
		// Shopkeeper
		name = "vsShopkeeper"
		room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
		ix+=4
		
		// Item Shop
		name = "vsShopItem"
		repeat(buffetStacks+irandom_range(2,4)) {
			room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
			ix+=3
		}
		
		name = "vsAltar"
		
		var altarSpawn
		if(level%3=0) altarSpawn = 3
		else altarSpawn = irandom(1)
		
		repeat(altarSpawn) {
			room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
			ix+=3
		}
		
		//End R
		name = "vsEndR"
		room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
		ix+=5
	
	#endregion
	
	//show_debug_message("Shop Generated "+string(ix*32)+" wide")
	//show_debug_message("Room Width is "+string(room_width))
	// and when you're done:
	ds_map_destroy(json_rooms);
}

function genEvCave(){
	
	tileMap = layer_tilemap_get_id("terrain")
	tilemap_set_width(tileMap,room_width)
	
	var json_rooms = vaultdataShop()
	
	ix = 5
	iy = 0
	
	var name = choose("vsEventCave","vsEventCave2","vsEventJump","vsEventSplit");
	//show_debug_message("Vault"+name)
	
	room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
	ds_map_destroy(json_rooms);
	ix+=15
	
}

function genEvRare(){
	
	tileMap = layer_tilemap_get_id("terrain")
	tilemap_set_width(tileMap,room_width)
	
	var json_rooms = vaultdataShop()
	
	ix = 5
	iy = 0
	
	var name = choose("vsEventRare","vsEventRare","vsEventRare2");
	//show_debug_message("Vault"+name)
	
	room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
	ds_map_destroy(json_rooms);
	ix+=15
	
}
