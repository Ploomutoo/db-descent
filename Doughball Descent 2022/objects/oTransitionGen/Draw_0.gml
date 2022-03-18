var offset = oCamera.y + oCamera.camHeight/2
offset = round(offset)

draw_sprite_ext(sTransitionGlow,option[0],0  ,offset,1,1,0,c_white,image_alpha)
draw_sprite_ext(sTransitionGlow,option[1],190,offset,1,1,0,c_white,image_alpha)

draw_sprite_ext(sTransitionIcons,option[0],95,offset-48,1,1,0,c_white,sinOut)
draw_sprite_ext(sTransitionIcons,option[1],285,offset-48,1,1,0,c_white,sinOut)