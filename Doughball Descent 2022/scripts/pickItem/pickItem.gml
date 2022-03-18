function pickItem(){
	var i = array_length(oTally.itemWeights)-1
	
	//show_debug_message("\nItem Weight Check")
	var itemPool = ds_list_create()
	
	//show_debug_message("\n")
	while(i>=0){
		
		if(oTally.itemWeights[i,1]>0) ds_list_add(itemPool,i)
		//else show_debug_message(object_get_name(oTally.itemWeights[i,0])+"'s weight is "+string(oTally.itemWeights[i,1]))
		i--
	}
	
	//show_debug_message("Pool size of "+string(ds_list_size(itemPool)));
	if(ds_list_size(itemPool)<1) {
		iwGravitate();
		return(oiHeartbeet);
	}
	
	i = itemPool[|irandom(ds_list_size(itemPool)-1)]
	//show_debug_message(object_get_name(oTally.itemWeights[i,0])+" pulled\n")
	oTally.itemWeights[i,1]-=2
	
	ds_list_destroy(itemPool);
	
	//weightUpdate(oTally.itemWeights[i,0],30,5)
	return(oTally.itemWeights[i,0])
}
	

function iwGravitate(){
	
	for(var i = array_length(oTally.itemWeights)-1; i>=0; i--){
		
		if(oTally.itemWeights[i,1]<1) { 
			
			oTally.itemWeights[i,1]++; 
		}
				
	}	
}