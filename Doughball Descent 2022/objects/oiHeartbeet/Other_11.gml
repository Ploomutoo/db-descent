oPlayer.heartMax -= stacks*2;
if(oPlayer.heartMax<2) oPlayer.heartMax = 2;

oPlayer.hearts = min(oPlayer.hearts,oPlayer.heartMax)