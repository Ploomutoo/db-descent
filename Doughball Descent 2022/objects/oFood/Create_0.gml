sCount = 90
image_speed = 0

var rarity = irandom(9)+1

switch(rarity){
	case 1:
	case 2:
	case 3:
	case 4:
		calories = 5
		image_index = 0
		break;
	case 5:
	case 6:
	case 7:
		calories = 10
		image_index = 1
		break;
	case 8:
	case 9:
		calories = 15
		image_index = 2
		break;
	case 10:
		calories = 25
		image_index = 3
		break;
}