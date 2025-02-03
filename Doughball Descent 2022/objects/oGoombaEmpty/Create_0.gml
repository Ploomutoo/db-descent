if(!instance_exists(oTerrainMaster)) exit;

switch(oTerrainMaster.area){
	case 2:
		instance_create_depth(x,y,0,oCarrotWorm)
		break;
		
	case 3:
		
		var iy = y;
		var out = 5;
		while(tsCheckEmpty(x,iy)){
			if(out<1 || iy<0) exit;
			
			iy-=32;
			out--;
		}
		instance_create_depth(x,iy-32,0,oUdder)
		break;
		
	case 4:
		instance_create_depth(x,y,0,oParagoomba)
		break;
		
	case 5:
		instance_create_depth(x,y,0,oGummyWorm)
		break;
		
	default:
		instance_create_depth(x,y,0,oBigWorm)
		break;
		
}

instance_destroy()