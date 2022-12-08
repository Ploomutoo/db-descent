//show_debug_message(script_get_name(option[0])+" or "+script_get_name(option[1])+"?")
if(room != rChoice) exit;

if(x>180) {
	var op = option[1]
} else {
	var op = option[0]
}

option = op
//show_debug_message("Option "+string(op))

//show_debug_message(string(op))
if(op>0) room_set_height(rEvent,512)
else room_set_height(rEvent,512)

//show_debug_message("X of "+string(oPlayer.x)+". Choice of "+script_get_name(option))