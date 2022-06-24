if(room=rGame){
	levelsGone++
} else if (false){
	
	var i = array_length(oTally.itemWeights)-1
	
	show_debug_message("Item Weight Check")
	while(i>=0){
		show_debug_message(object_get_name(oTally.itemWeights[i,0])+"'s weight is "+string(oTally.itemWeights[i,1]))
		i--
	}	
	
}

//show_debug_message("Room is "+room_get_name(room))
//show_debug_message("Got "+string(foodGot[0])+" rice")