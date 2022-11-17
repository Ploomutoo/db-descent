foodGot[0] = 0
calGot = 0
foesStomped = 0
foesBomped = 0
levelsGone = 0

foodTypes = sprite_get_number(sFood)

var i = 0
foodGot = array_create(foodTypes-1,0);

itemWeights = 0
itemsGot = ds_list_create();

i = 0
var i2 = 0
var outString = "<Item Inventory>";
//show_debug_message(outString)

while(outString!="<undefined>"){
	
	if(string_char_at(outString,2)="i") {
		//show_debug_message(outString + string(i2))
		itemWeights[i2,0] = i-1
		itemWeights[i2,1] = 1
		
		i2++
	}
	outString = object_get_name(i)
	i++
}