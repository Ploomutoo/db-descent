image_alpha = lerp(0,1,interp)
image_xscale = lerp(0.3,1,interp)
image_yscale = image_xscale
interp+=accel
accel = accel*0.9