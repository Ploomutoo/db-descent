function setAreaCosmetics(argument0){
	switch(argument0) {
		case 1:
		currentMusic = musLevel1;
		tilemap_tileset(tileMap,tsLevel1)
		bgUpdate(sBgBread)
		oSidebarR.colorA = $3c6f9e
		oSidebarR.colorB = $7dd9f0
		
		break;
		case 2:
		currentMusic = musLevel2;
		tilemap_tileset(tileMap,tsLevel2)
		bgUpdate(sBgProduce)
		oSidebarR.colorA = $63b84b
		oSidebarR.colorB = $3696e0
		
		break;
		case 3:
		currentMusic = musLevel3;
		tilemap_tileset(tileMap,tsLevel3)
		bgUpdate(sBgCow)
		oSidebarR.colorA = $ffb196
		oSidebarR.colorB = $f7e08d
		
		break;
		case 4:
		currentMusic = musLevel4;
		tilemap_tileset(tileMap,tsLevel4)
		bgUpdate(sBgMeat)
		oSidebarR.colorA = $855ac7
		oSidebarR.colorB = $6875e8
		
		break;
		case 5:
		currentMusic = musLevel5;
		tilemap_tileset(tileMap,tsLevel5)
		bgUpdate(sBgDessert)
		oSidebarR.colorA = $ca5fa1
		oSidebarR.colorB = $c887df
		
		break;
	}
	playMusic(currentMusic)
}