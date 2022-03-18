randomize()

var xRatio = 0.8*display_get_width()/640
var yRatio = 0.8*display_get_height()/360

if(xRatio>yRatio) yRatio = xRatio
else xRatio = yRatio

window_set_size(640*xRatio,360*yRatio)

alarm[0]=1

flashTick = 0
flashOn = true

selection = 0
global.playerCol = c_white
//make_color_rgb(252, 139, 226)

screen = 0