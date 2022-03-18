image_speed = 0
state = 0
yTo = oPlayer.y-200
harmful = false;

warnFlash = 0;

warnHeight = 2+viewHeight/sprite_get_width(sWarning)
warnWidth = 16/sprite_get_width(sWarning)

sprite_index = choose(sCannonballRed, sCannonballGreen, sCannonballPurple, sCannonballBlue);