enum tilesetIndex
{
	GENERIC,
	BREAD = 1,
	VEGETABLE = 2,
	DAIRY = 3,
	MEAT = 4,
	DESSERT = 5,
	ANUBIS = 6,
	SHOP,
	TEMPLE
}

function tilesetFromIndex (index)
{
	switch(index)
	{
		case tilesetIndex.GENERIC:
		return(tsGeneric);
		break;
		case tilesetIndex.SHOP:
		return(tsLevel0);
		break;
		case tilesetIndex.BREAD:
		return(tsLevel1);
		break;
		case tilesetIndex.VEGETABLE:
		return(tsLevel2);
		break;
		case tilesetIndex.DAIRY:
		return(tsLevel3);
		break;
		case tilesetIndex.MEAT:
		return(tsLevel4);
		break;
		case tilesetIndex.DESSERT:
		return(tsLevel5);
		break;
		case tilesetIndex.ANUBIS:
		return(tsLevel6);
		break;
		case tilesetIndex.TEMPLE:
		return(tsTemple);
		break;
	}
}

tilemap_tileset(tileMap,tilesetFromIndex(tsIndex))

with(oHazGravel)
{
	image_index = other.area-1
}

with(oBouncyBlock)
{
	image_index = other.area-1
}

with(oHazBouncy) {
	image_index = other.area-1
	if(tilemap_get_at_pixel(tileMap,x,y+16)=0 || tilemap_get_at_pixel(tileMap,x,y-16)>0){
		onDestroy = false
		instance_destroy();
	}
}


with(oFood) {
	image_index+=4*(other.area-1)
	if(tilemap_get_at_pixel(tileMap,x,y)=3){
		onDestroy = false
		instance_destroy();
	}
}

show_debug_message("set tilemap success")