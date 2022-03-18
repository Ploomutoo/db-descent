event_inherited()

item = instance_create_layer(x,y,layer,pickItem())
price = item.price + 20*(oTally.levelsGone-1)
coupon = 0