var popup = instance_create_depth(oPlayer.x,oPlayer.y-32,depth-4,oPopupText)
popup.drawString = nameTag

x = 5
y = 318

var i = oPlayer.items
while(i>=4){
	y-=32	
	i-=4
}
while(i>0){
	x+=32
	i--
}

oPlayer.items++
persistent=true
bought = true