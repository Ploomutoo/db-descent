var popup = instance_create_layer(x,y-48,layer,oPopupText)
popup.drawString = "Break Frenzy!"

alarm[3] = room_speed*5
soundRand(sndZevFrenzy)
instance_destroy(other)