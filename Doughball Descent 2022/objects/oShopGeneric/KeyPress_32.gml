cancelIfLinePresent

if(playerOn && price>0) {
	if(oPlayer.weight>=price && oPlayer.weight>50){
		coupon = 0
		
		with(oiLoyaltyCard) if(bought) {
			var post = instance_place(oPlayer.x,oPlayer.y,oShopPost)
			if(post!=noone) post.coupon++
		}
		
		
		
		if(coupon>0) {
			show_debug_message(string(coupon)+" coupon stacks")
			var i = 1
			var chance = 0
		
			while(coupon>0){
				chance+=15/i
				i = i*2
				coupon--
			}
			
			var roll = irandom(99)
			show_debug_message("Rolled "+string(roll)+" against "+string(chance))
			
			if(roll<=chance) with(oPlayer) {
				var popup = instance_create_layer(x,y-64,layer,oPopupText)
				popup.drawString = "FREE"
				
				oTextBox.voice = oShopkeeper.voice
				oTextBox.announce(0,"This one's on me, cheers");
				
			} else oPlayer.weight = max(oPlayer.weight-price,50)
			
		} else {
			oPlayer.weight = max(oPlayer.weight-price,50)
		}
		
		soundRand(sndItem)
		price = 0;
		image_index = 1
		
		event_user(0)
	} else {
		
		oTextBox.voice = oShopkeeper.voice
		oTextBox.announce(0,"Sorry squirt, I don't take credit");
	}
}