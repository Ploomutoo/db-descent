foodCount = 0
ft[0]=0
ft[1]=0
ft[2]=0
ft[3]=0

with(oFood){
	oFoodCounter.foodCount++
	oFoodCounter.ft[image_index]++
}
show_debug_message(string(foodCount)+" food items spawned")

var i = 0
while(i<4){
	var txt = "Food Tier "+string(i+1)+" appeared "+string(ft[i])+" times"
	ft[i]=ft[i]/foodCount*100
	txt = txt+"; "+string(ft[i])+"% of the time"
	
	show_debug_message(txt)
	i++	
}