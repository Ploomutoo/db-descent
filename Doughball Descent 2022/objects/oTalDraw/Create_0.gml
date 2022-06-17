foodTypes = sprite_get_number(sFood)
room_set_height(rGame,2048)

#macro xpInc 100
xpCost = xpInc
lvl = 1

items = 0
cornerX = room_width-48
cornerY = room_height-48
calDisplay = 0
cdSound = 0

with(oBase){
	x = oTalDraw.cornerX
	y = oTalDraw.cornerY
	
	var i = oTalDraw.items
	while(i>=6){
		y-=32
		i-=6
	}
	while(i>0){
		x-=32
		i--
	}
	
	oTalDraw.items++
}

foodTallyOn = 0
alarm[0] = room_speed/3

//frameSize = (sprite_width+32)/48

/*sinCount = 0
sinCap = 180
sinSpeed = 10
spinScale = 1
spinTo = 0*/

sinCount = 0
sinCap = 180
sinSpeed = 10
spinTo = image_index+1
spinScale = 0
