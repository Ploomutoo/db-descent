with(oFood)
{
	if(irandom(1)=1)
	{
		instance_create_layer(x,y,layer,oZevPickup)
		instance_destroy()
	}
}