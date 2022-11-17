foodTypes = sprite_get_number(sFood)
room_set_height(rGame,2048)

#macro xpInc 300
xpCost = xpInc
lvl = 1

items = []
calDisplay = 0
cdSound = 0

//foodTallyOn = 0
alarm[0] = room_speed

with(oTally) {
	for(i = 3; i>=0; i--) 
	{
		var inst = instance_create_layer(32,52+40*i,layer,oTalCollapsible);
		var sum = 0;
		
		for(var i2 = i; i2<foodTypes-4; i2+=4) {
			array_push(inst.food,foodGot[i2]);
			array_push(inst.foodSprites,i2);
			sum+=foodGot[i2]
		}
		inst.image_index = i;
		inst.foodSum = sum;
	}
}


sinCount = 0
sinCap = 180
sinSpeed = 10
spinTo = image_index+1
spinScale = 0
