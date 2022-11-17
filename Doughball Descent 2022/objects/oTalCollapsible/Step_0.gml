if(aPos>=1) exit;

var aOutput = animcurve_channel_evaluate(aChannel,aPos)
aPos += 0.05

aOutput = 1 + aOutput/4

image_xscale = 1/aOutput
image_yscale = aOutput