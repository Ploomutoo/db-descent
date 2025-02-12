/*function coJump() {
	if(global.controllerGet){
		if gamepad_button_check_pressed(0,gp_face1) return(true)
		else return(false)
	} else {
		if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) return(true)
		else return(false)
	}
}

function coUp() {
	if(global.controllerGet){
		if (gamepad_axis_value(0, gp_axislv)<0) return(true)
		else return(false)
	} else {
		if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) return(true)
		else return(false)
	}
}*/

#macro cJump (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
#macro cJumpDown (keyboard_check(ord("W")) || keyboard_check(vk_up))
#macro cBash keyboard_check_pressed(vk_space)//||keyboard_check_pressed(vk_numpad0)

#macro cLeft (keyboard_check(ord("A"))||keyboard_check(vk_left))
#macro cRight (keyboard_check(ord("D"))||keyboard_check(vk_right))

#macro cLeftPressed (keyboard_check_pressed(ord("A"))||keyboard_check_pressed(vk_left))
#macro cRightPressed (keyboard_check_pressed(ord("D"))||keyboard_check_pressed(vk_right))

#macro cUp cJump
#macro cDown keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)
#macro cDownHeld keyboard_check(ord("S")) || keyboard_check(vk_down)