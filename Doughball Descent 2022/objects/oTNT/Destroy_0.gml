if(!onDestroy) exit;
tilemap_set_at_pixel(tileMap,0,x+1,y+1)

fExplode(x+16,y+16,3)

createParticles(x+16,y+16,6,sPaRock)
soundRand(sndBreak)