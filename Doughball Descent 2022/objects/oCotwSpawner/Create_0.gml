poolInactive = ds_list_create()

for (var i=10;i>0;i--)
{	
	var child = instance_create_layer(0,0,layer,oCotw)
	ds_list_add(poolInactive,child)
	child.mother = self
}

alarm[0] = 1