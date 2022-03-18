spillTimer--

if(image_index = 0) { if(spillTimer<30) image_index = 1

} else if(image_index = 1) { if(spillTimer<0) image_index = 2

} else if(image_index = 2) {
	milkTick++
	if(milkTick>4) {
		instance_create_depth(x,y+32,depth-milkSpillDepth,oMilkspill)
		milkSpillDepth+=1
		
		milkTick = 0
	}
	if(spillTimer<-spillDuration){
		
		milkTick = 4
		spillTimer = spillInterval
		image_index = 0
		milkSpillDepth = 1
		
	}
}
