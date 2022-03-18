while (height<30){
	height ++
	tmY++	
	if(tilemap_get(tileMap,tmX,tmY)=3) break
	else if(tilemap_get(tileMap,tmX,tmY)>0 && irandom(3)=0) break;
	
	tilemap_set(tileMap,0,tmX,tmY)
}

tilemap_set(tileMap,3,tmX,tmY)