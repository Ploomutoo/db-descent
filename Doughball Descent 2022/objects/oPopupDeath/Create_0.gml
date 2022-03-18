image_alpha = 0
interp = 0
accel = 0.15
x = 320
y = 180

audio_stop_all()

deathTip = tip()
dtWidth = string_width(deathTip)+8
dtHeight= string_height(deathTip)
soundRand(sndHurt)
audio_play_sound(sndDied,0,0)