tileClear(x/32,y/32);

var i = emptyChance + normalChance + durableChance + invulnChance;
var tile = 0;
i = random(i)

i-=emptyChance;
if(i<=0) {
	tile = 0;
	exit;
}

i-= normalChance;
if(i<=0) tile = 1;

i-= durableChance;
if(i<=0) tile = 2;

i-= durableChance;
if(i<=0) tile = 3;

tilemap_set_at_pixel(tileMap,tile,x,y)
instance_destroy();
