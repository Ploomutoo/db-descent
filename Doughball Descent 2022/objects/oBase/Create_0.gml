bought = false;
stacks = 0;
image_speed = 0;

function mountItem(itemCount) {
	
	x = 5-280
	y = 318

	while(itemCount>=4){
		y-=32	
		itemCount-=4
	}
	while(itemCount>0){
		x+=32
		itemCount--
	}
}
