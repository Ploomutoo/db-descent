/// @description Item Gained
createEffect(x,y,sPaPoof);

var removeInd = object_index;
if(finite=-1 || instance_number(removeInd)<finite) exit;

with(oTally) {
	for(var i = array_length(itemWeights)-1; i>=0; i--) 
	{
		show_debug_message("Removing "+other.nameTag+" at address "+string(i))
		if(itemWeights[i,0]=removeInd) break;
	}
	array_delete(itemWeights,i,1);
}