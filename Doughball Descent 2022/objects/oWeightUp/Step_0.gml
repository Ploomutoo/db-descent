tick--;
if(tick > 0) exit;
tick = 4;

image_alpha = image_alpha*(image_alpha-0.001);
if(image_alpha<0.1) instance_destroy()

for(var i = array_length(p_array)-1; i>=0; i--)
{
	
	p_array[i,0] += 1;
	if(p_array[i,0]>14) p_array[i,0] -= 14;
	
	p_array[i,1] += p_array[i,3]/2;
	p_array[i,2] += p_array[i,4]/2;
	
	if(p_array[i,3]>1) p_array[i,3]*=0.9;
	if(p_array[i,4]>-2)p_array[i,4]-=0.05;
}