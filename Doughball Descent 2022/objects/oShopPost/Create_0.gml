event_inherited()

item = instance_create_layer(x,y,layer,pickItem())
price = priceScale(item.price);
coupon = 0

description = item.description
itemSprite = item.image_index;

if(instance_exists(oShopkeeper)){
	
	ds_list_add(oShopkeeper.linePool,item.shopkeeperQuote)
}

var itemInd = item.object_index;
instance_destroy(item);
item = itemInd;
