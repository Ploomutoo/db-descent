image_xscale += (targetScale-image_xscale)/5

if(targetScale = 0)
{
	if(image_xscale<0.1) instance_destroy()	
}