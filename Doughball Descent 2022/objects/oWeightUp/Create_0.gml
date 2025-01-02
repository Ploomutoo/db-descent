image_alpha = 1;
tick = 4;
//			frame	x,	y,	xvelo,	yvel,	color
p_array =[0,0];
var i = 15+irandom(25)
//sConfetti random(14)
while(i>=0)
{
	p_array[i] = 
	[
	random(14), //frame	0
	x,			//			1
	y,			//			2
	30-irandom(60), //xvel	3
	6+irandom(12), //yvel	4
	choose(c_red,c_yellow,c_lime,c_fuchsia,c_aqua)
	];
	i--;
}