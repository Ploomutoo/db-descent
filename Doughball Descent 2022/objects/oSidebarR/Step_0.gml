

var progress = clamp((oPlayer.y-128)/(room_height-160),0,1)
drawProg = lerp(0,altometerHeight,progress)

//playerDepth = clamp(round(oPlayer.y/32),0,mapHeight)