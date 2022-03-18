if(screen!=0) exit

flashTick++
if(flashTick>19){
	flashOn = !flashOn
	flashTick = 0	
}

/*if(keyboard_check_pressed(ord("A"))||keyboard_check_pressed(ord("D"))){
	selection++
	if(selection>1) selection = 0
	
	switch(selection){
		case 0:
		global.playerCol = make_color_rgb(252, 139, 226)
		break;
		case 1:
		global.playerCol = make_color_rgb(189, 246, 255)
		break;
		default:
		global.playerCol = c_white
		break;
	}
	
}*/