tileHealth--
soundRand(sndTileDamage)

if(tileHealth<=0) instance_destroy();
else createEffect(x,y,sBlockHighlight)