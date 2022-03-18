event_inherited()

if(faceDir = 0) faceLeft = irandom(1)
else faceLeft = -faceDir

stompable = false
length = sprite_width

desSpeed = 2

if(faceLeft) desSpeed = -desSpeed
else image_xscale = -1

hspeed = desSpeed
image_speed = 0
sinCount = irandom(360)

accel = 0.05
bubTimer = 20