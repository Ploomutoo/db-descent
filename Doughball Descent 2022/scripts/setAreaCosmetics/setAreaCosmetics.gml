function setAreaCosmetics(argument0){
	density = 3;
	switch(argument0) {
		case 1:
		currentMusic = musLevel1;
		tilemap_tileset(tileMap,tsLevel1)
		bgUpdate(sBgBread)
		global.colorA = $3c6f9e
		global.colorB = $7dd9f0
		
		break;
		case 2:
		currentMusic = musLevel2;
		tilemap_tileset(tileMap,tsLevel2)
		bgUpdate(sBgProduce)
		global.colorA = $63b84b
		global.colorB = $3696e0
		
		break;
		case 3:
		currentMusic = musLevel3;
		tilemap_tileset(tileMap,tsLevel3)
		bgUpdate(sBgCow)
		global.colorA = $ffb196
		global.colorB = $f7e08d
		
		break;
		case 4:
		currentMusic = musLevel4;
		tilemap_tileset(tileMap,tsLevel4)
		bgUpdate(sBgMeat)
		global.colorA = $855ac7
		global.colorB = $6875e8
		
		break;
		case 5:
		currentMusic = musLevel5;
		tilemap_tileset(tileMap,tsLevel5)
		bgUpdate(sBgDessert)
		global.colorA = $ca5fa1
		global.colorB = $c887df
		
		density = choose(2,5);
		
		break;
	}
	playMusic(currentMusic)
}