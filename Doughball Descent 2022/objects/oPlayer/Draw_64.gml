if(dead) exit;

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_font(fntMini)
var iy = uiSpacing
var ix = uiSpacing;

#region hearts & arrows
ix+=4;
heartDraw += 0.1
if(heartDraw>4) heartDraw-=4

var _heartscale = 0.5
var _arrowscale = 0.5

var j = heartMax
for(var i = 0; i<j; i+=2){
	
	if(i<hearts-1) draw_sprite_ext(sToonHeart,heartDraw+i/8,ix,iy,_heartscale,_heartscale,0,c_white,1)
	else if(i<hearts) draw_sprite_ext(sToonHeartHalf,heartDraw+i/8,ix,iy,_heartscale,_heartscale,0,c_white,1)
	else draw_sprite_ext(sToonHeartEmpty,0,ix,iy,_heartscale,_heartscale,0,c_white,1)
	
	ix+=64*_heartscale;
	
}
j += soulHearts
while(i<j){
	draw_sprite_ext(sToonHeartShield,heartDraw+i/8,ix,iy,_heartscale,_heartscale,0,c_white,1)
	ix+=64*_heartscale;
	i++;
}

//arrows
ix = uiSpacing;
iy += 32+uiSpacing/2;

j = weightCategories.assessCrushes();
ix += (j-1)*48*_arrowscale
for(i = j; i>0; i--){
	
	if(i>crushes) draw_sprite_ext(sToonArrowEmpty,heartDraw+i/8,ix,iy,_arrowscale,_arrowscale,0,c_white,1)
	else if (i=crushes) draw_sprite_ext(sToonArrowActive,heartDraw+i/8,ix,iy,_arrowscale,_arrowscale,0,c_white,1)
	else draw_sprite_ext(sToonArrow,heartDraw+i/8,ix,iy,_arrowscale,_arrowscale,0,c_white,1)
	
	ix-=48*_arrowscale;
	
}

#endregion

iy=uiSpacing;
ix=dispWidth-uiSpacing-146

if(weight<weightCategories.maxStableWeight)
{
	draw_sprite(sWeightMeter,0,ix+2,iy)
	draw_sprite_ext(sWeightMeter,1,ix+2,iy,weightCategories.dProg,1,0,c_white,1)
	draw_sprite(sWeightBar,0,ix,iy)

	draw_set_halign(fa_right)
	draw_text(ix-2,iy+5,string(weight));
	draw_sprite(sWeightStage,weightCategories.stage,ix+8,iy+18)
}
else 
{	
	draw_sprite(sWeightStage,weightCategories.stage,ix+8,iy+18)
	
	draw_sprite(sWeightBarOverfull,1,ix,iy)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var scale = sqrt(weight)/34.64
	
	draw_set_font(fntBase);
	draw_set_color(c_black);
	draw_text_transformed(ix+74,iy+13,string(weight),scale,scale,0)
	draw_text_transformed(ix+74,iy+11,string(weight),scale,scale,0)
	draw_text_transformed(ix+72,iy+13,string(weight),scale,scale,0)
	draw_text_transformed(ix+72,iy+11,string(weight),scale,scale,0)
	draw_set_color(c_white);
	draw_text_transformed(ix+73,iy+12,string(weight),scale,scale,0)
	//draw_text_outlined(ix+73,iy+9,string(weight));
}

if(combo>0) draw_sprite(sComboMeter,combo-1,ix+64,iy+22)
if(cheat) draw_text(ix+64,iy+22,"endHeight: "+string(endHeight));

var progress = clamp((y-128)/(room_height-160),0,1)
drawProg = lerp(0,altometerHeight,progress)

iy += 18 + uiSpacing; //height of sWeightBar
ix += 59 //width of sWeightStage

ix = dispWidth-uiSpacing
	
if(room=rGame) {
	ix-=16
	draw_sprite_ext(sAltometer,0,ix,iy,1,1,0,global.colorB,1)
	draw_sprite(sAltometer,1,ix,iy+drawProg)

	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}