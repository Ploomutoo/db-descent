/// @description Update Price
var altVal = getAltarVar(altarType)
altarVal = getAltarVar(altarType)
price = 100*power(2,altVal)

var _offering = instance_find(oiOffering,0)
if(_offering != noone)
{
	for(var i = _offering.stacks+1; i>0; i--)
	{
		price = price*0.9
	}
}