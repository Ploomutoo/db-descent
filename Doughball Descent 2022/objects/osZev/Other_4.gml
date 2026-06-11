with(oFood)
{
	if(irandom(10)<stacks)
	{
		instance_create_layer(x,y,layer,oZevPickup)
		instance_destroy()
	}
}