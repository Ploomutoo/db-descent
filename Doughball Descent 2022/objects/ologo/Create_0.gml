//show_debug_message("help")
//show_debug_overlay(true)

if(audio_group_is_loaded(agMusic)){

    room_goto(rTitle);
	exit;
}

randomize();
window_set_caption("Doughball Descent")//+taglines())

canLeaveIntro = false;
audio_group_load(agMusic);

var xRatio = 0.8*display_get_width()/640
var yRatio = 0.8*display_get_height()/360

if(xRatio>yRatio) yRatio = xRatio;
else xRatio = yRatio;

window_set_size(640*xRatio,360*yRatio);
draw_set_font(fntBig)

alarm[0]=room_speed*3;
alarm[1]=1;
