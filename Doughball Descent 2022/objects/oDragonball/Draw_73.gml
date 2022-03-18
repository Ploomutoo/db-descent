if(warningTick>20) exit;

gpu_set_blendmode(bm_add);
draw_sprite(sWarningCircle,warningFrame,toX-32,toY-32);
warningFrame+=0.1
if(warningFrame>sprite_get_number(sWarningCircle)) warningFrame = 0

gpu_set_blendmode(bm_normal);