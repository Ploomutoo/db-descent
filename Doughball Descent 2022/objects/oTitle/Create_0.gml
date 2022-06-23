randomize()

room_pack_eval_script = function(code) { 
  with(other) {
	//show_debug_message(object_get_name(object_index) + " executes: " + code)
	live_execute_string(code)
  } 
}

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

objHelp = instance_nearest(0,0,oHelp)
objLevSel = instance_create_layer(room_width/2,room_height/2,layer,oLevelSelect);
