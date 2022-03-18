with(oPlayer) if(hearts<heartMax) hearts++
else {
	var get = calBonus(50)
	weight+=get
	var popup = instance_create_layer(x,y-30,layer,oPopupText)
	popup.drawString = "+"+string(get)
}

soundRand(sndHeart)
instance_destroy()