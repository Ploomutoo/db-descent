randomize()

room_pack_eval_script = function(code) { 
  with(other) {
	//show_debug_message(object_get_name(object_index) + " executes: " + code)
	live_execute_string(code)
  } 
}

var xRatio = 0.8*display_get_width()/640
var yRatio = 0.8*display_get_height()/360

if(xRatio>yRatio) yRatio = xRatio
else xRatio = yRatio

window_set_size(640*xRatio,360*yRatio)
alarm[0]=1

cursorOn = 0
menu[0] = "Play"
menu[1] = "Help\n& Credits"
menu[2] = "Settings"
menu[3] = "Quit"

aCurve = animcurve_get(acJiggle)
aChannel = animcurve_get_channel(aCurve,0)

aPos = 1
aOutput = 0

fadeIn = -30