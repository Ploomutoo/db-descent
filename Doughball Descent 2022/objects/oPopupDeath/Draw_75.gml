draw_self()

draw_set_color(c_black)
draw_set_alpha(0.6)
draw_rectangle(320-dtWidth/2,235,320+dtWidth/2,235+dtHeight,0)
draw_set_color(c_white)
draw_set_alpha(1)

draw_set_halign(fa_center)
draw_text(320,235,deathTip)
draw_set_halign(fa_left)