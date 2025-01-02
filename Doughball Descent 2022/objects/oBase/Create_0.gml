bought = false;
stacks = 0;
image_speed = 0;
flash = 0;

function mountItem(itemCount) {
	
	show_debug_message(string(itemCount))
	
	x = 4 + 32*(itemCount%19)
	y = viewHeight - 36 - 32*floor(itemCount/19);

}
