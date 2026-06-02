chainAngle += chainSpeed
image_angle+=8

x = anchorX + lengthdir_x(32*chainLength,chainAngle)
y = anchorY + lengthdir_y(32*chainLength,chainAngle)

if(x>room_width) x -= room_width
else if(x<0) x += room_width

if(turnedCooldown>0) turnedCooldown--;