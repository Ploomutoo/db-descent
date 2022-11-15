bought = false;
stacks = 0;
image_speed = 0;
flash = 0;

function mountItem(itemCount) {
	
	show_debug_message(string(itemCount))
	
	x = -275 + 32*(itemCount%4)
	y = 318	- 32*floor(itemCount/4);

}
