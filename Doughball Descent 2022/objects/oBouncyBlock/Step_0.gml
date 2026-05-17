if(abs(1-wobble)<0.1) wobDeltaDelta = 0.01
else wobDeltaDelta = 0.05

if(wobble<1) wobDelta += wobDeltaDelta
else if (wobble>1) wobDelta -= wobDeltaDelta

wobble += wobDelta
wobDelta = wobDelta * 0.8

image_xscale = wobble
image_yscale = 1/wobble