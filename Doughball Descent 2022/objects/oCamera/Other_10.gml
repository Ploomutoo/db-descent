bgyOffset = 0

bgX = sprite_get_width(bgSprite)
bgY = sprite_get_height(bgSprite)

bgTilesX = 1+ceil(viewWidth/bgX)
bgTilesY = 1+ceil(viewHeight/bgY)