y-=tranSpeed
if(y<=-300) 
{
	textOffset -= toRate;
	toRate += 0.5
	if(textOffset<-16) instance_destroy()
}