function eventTemple(){
event = {
		
	sprite: sEvTemple,
	eName : "Temple Entrance",
	//eInit : function() { soundRand(sndAltarUse) },
	txExposition : "You come upon the ornate gate of an abandoned temple. "
	+"You are free to enter at your leisure",
	txAttempt : "The ancient gate creaks open",
	txDecline : "You may enter another time",
		
	eChance : function(){
		return([1,"Exit the current Stage?"]);
	},
		
	txSuccess : "You are greeted by a rush of stale air\nand the scent of tallow",
	success : function(){
		
		tilemap_clear(tileMap,0);
		tilemap_tileset(tileMap,tsTemple);
		
		soundRand(sndAltarUse);
		var json_rooms = vaultdataShop();
		var ix = 5; var	iy = 0;
	
		var name = "vsEventTemple";
		room_pack_load_map(json_rooms[?name], ix*32, iy*32, room_pack_flag_instances);
		ds_map_destroy(json_rooms);
		
		instance_create_depth(0,0,0,oFlash);
		//show_debug_message("camera count "+string(instance_number(oCamera)))
		with(oCamera) {
			
			bgSprite = sBgClouds;
			event_user(0);
			show_debug_message("cam invoked")
		}
		
		with(oEmpty) instance_destroy();
		with(oEvent) visible = false;
	},
		
	//txFailure : "",
	//failure : function(){},
	endFunc : function(){
		
		if(other.choice) { 
			//show_debug_message("running killfunct")
			with(oEvent) instance_destroy();		
		} else {
			other.state = 0;
			other.dim = 0;
			
		}
	}
} }
