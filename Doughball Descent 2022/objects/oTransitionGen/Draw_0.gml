var offset = oCamera.y + oCamera.camHeight/2
offset = round(offset)

draw_sprite_ext(sTransitionGlow,option[0],0,offset,selectionWidth/100,1,0,c_white,image_alpha)
draw_sprite_ext(sTransitionGlow,option[1],selectionWidth,offset,selectionWidth/100,1,0,c_white,image_alpha)

draw_sprite_ext(sTransitionIcons,option[0],selectionWidth*0.5,offset-48,1,1,0,c_white,sinOut)
draw_sprite_ext(sTransitionIcons,option[1],selectionWidth*1.5,offset-48,1,1,0,c_white,sinOut)