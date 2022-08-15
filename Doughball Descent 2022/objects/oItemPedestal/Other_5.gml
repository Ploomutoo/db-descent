if(item=noone) exit;

//cSprite-=1

for(var i = array_length(oTally.itemWeights)-1; i >= 0; i--) {
	
	if(oTally.itemWeights[i,0] = item) break
}

oTally.itemWeights[i,1]-=3;
show_debug_message(object_get_name(oTally.itemWeights[i,0])+"'s weight is "
+string(oTally.itemWeights[i,1]));