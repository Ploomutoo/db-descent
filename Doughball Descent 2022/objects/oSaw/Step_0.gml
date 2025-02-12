chainAngle += chainSpeed
image_angle+=8

x = anchorX + lengthdir_x(32*chainLength,chainAngle)
y = anchorY + lengthdir_y(32*chainLength,chainAngle)

if(turnedCooldown>0) turnedCooldown--;