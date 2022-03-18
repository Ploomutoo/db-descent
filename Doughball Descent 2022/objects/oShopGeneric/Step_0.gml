if(price=0) exit

playerOn = false

var lerpFrom = 0
if(!instance_place(x,y,oPlayer)) {
	if(intWeight>0) intWeight=max(intWeight-3,0)
	//image_index = 0
} else {
	lerpFrom = 1
	playerOn = true;
	var opWeight = oPlayer.weight-50
	if(intWeight<price && intWeight<opWeight){
		intWeight+=min((opWeight-intWeight)/6,10)
		if(intWeight>price) intWeight = price
		//intWeight=min(intWeight+(oPlayer.weight-intWeight)/6,price)
	}
}

image_index = lerp(lerpFrom,4.99,(intWeight)/price)
