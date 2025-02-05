	//FastNoise(x, y, nbOctave)
	///FastNoise(x, y, nbOctave)
	// Source of original Java version:
	// http://www.java-gaming.org/index.php?topic=23771.0
	/*
	* This file is part of 3DzzD http://dzzd.net/.
	*
	* Released under LGPL
	*
	* 3DzzD is free software: you can redistribute it and/or modify
	* it under the terms of the GNU Lesser General Public License as published by
	* the Free Software Foundation, either version 3 of the License, or
	* (at your option) any later version.
	*
	* 3DzzD is distributed in the hope that it will be useful,
	* but WITHOUT ANY WARRANTY; without even the implied warranty of
	* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	* GNU Lesser General Public License for more details.
	*
	* You should have received a copy of the GNU Lesser General Public License
	* along with 3DzzD.  If not, see <http://www.gnu.org/licenses/>.
	*
	* Copyright 2005 - 20010 Bruno Augier
	*/
	/**
	 * Fast perlin noise generation
	 *
	 * Generate a perlin noise with 8 octave and a persistence of 0.5
	 *
	 * NB:
	 * - output range between 0 and 255
	 * - maximum octave = 7
	 *
	 * you can change type of noise between grad & value noise by commenting/uncommenting block
	 * you can change type of interpolation between bicubic/bilinear by commenting/uncommenting block
	 */ 

function noise(nx,ny,nbOctave)
{
	var result=0;   
	var frequence256=256;
	var sx=floor((nx)*frequence256);
	var sy=floor((ny)*frequence256);
	var octave=nbOctave; 
	while(octave!=0)
	{
	   var bX=sx & $FF;
	   var bY=sy & $FF;
	   var sxp=sx>>8;
	   var syp=sy>>8;
     
	   //Compute noise for each corner of current cell
	   var Y1376312589_00=syp*1376312589;
	   var Y1376312589_01=Y1376312589_00+1376312589;
	   var XY1376312589_00=sxp+Y1376312589_00;
	   var XY1376312589_10=XY1376312589_00+1;
	   var XY1376312589_01=sxp+Y1376312589_01;
	   var XY1376312589_11=XY1376312589_01+1;
	   var XYBASE_00=(XY1376312589_00<<13)^XY1376312589_00;
	   var XYBASE_10=(XY1376312589_10<<13)^XY1376312589_10;
	   var XYBASE_01=(XY1376312589_01<<13)^XY1376312589_01;
	   var XYBASE_11=(XY1376312589_11<<13)^XY1376312589_11;
	   var alt1=(XYBASE_00 * (XYBASE_00 * XYBASE_00 * 15731 + 789221) + 1376312589) ;
	   var alt2=(XYBASE_10 * (XYBASE_10 * XYBASE_10 * 15731 + 789221) + 1376312589) ;
	   var alt3=(XYBASE_01 * (XYBASE_01 * XYBASE_01 * 15731 + 789221) + 1376312589) ;
	   var alt4=(XYBASE_11 * (XYBASE_11 * XYBASE_11 * 15731 + 789221) + 1376312589) ;
     
	   /*
	   *NOTE : on  for true grandiant noise uncomment following block
	   * for true gradiant we need to perform scalar product here, gradiant vector are created/deducted using
	   * the above pseudo random values (alt1...alt4) : by cutting thoses values in twice values to get for each a fixed x,y vector
	   * gradX1= alt1&0xFF
	   * gradY1= (alt1&0xFF00)>>8
	   *
	   * the last part of the PRN (alt1&0xFF0000)>>8 is used as an offset to correct one of the gradiant problem wich is zero on cell edge
	   *
	   * source vector (sXN;sYN) for scalar product are computed using (bX,bY)
	   *
	   * each four values  must be replaced by the result of the following
	   * altN=(gradXN;gradYN) scalar (sXN;sYN)
	   *
	   * all the rest of the code (interpolation+accumulation) is identical for value & gradiant noise
	   */
       
       
	   /*START BLOCK FOR TRUE GRADIANT NOISE*/
     
	   var grad1X=(alt1 & $FF)-128;
	   var grad1Y=((alt1 >> 8) & $FF)-128;
	   var grad2X=(alt2 & $FF)-128;
	   var grad2Y=((alt2 >> 8) & $FF)-128;
	   var grad3X=(alt3 & $FF)-128;
	   var grad3Y=((alt3 >> 8) & $FF)-128;
	   var grad4X=(alt4 & $FF)-128;
	   var grad4Y=((alt4 >> 8) & $FF)-128;
       
       
	   var sX1=bX>>1;
	   var sY1=bY>>1;
	   var sX2=128-sX1;
	   var sY2=sY1;
	   var sX3=sX1;
	   var sY3=128-sY1;
	   var sX4=128-sX1;
	   var sY4=128-sY1;
	   alt1=(grad1X*sX1+grad1Y*sY1)+16384+((alt1 & $FF0000)>>9); //to avoid seams to be 0 we use an offset
	   alt2=(grad2X*sX2+grad2Y*sY2)+16384+((alt2 & $FF0000)>>9);
	   alt3=(grad3X*sX3+grad3Y*sY3)+16384+((alt3 & $FF0000)>>9);
	   alt4=(grad4X*sX4+grad4Y*sY4)+16384+((alt4 & $FF0000)>>9);
       
	   /*END BLOCK FOR TRUE GRADIANT NOISE */
     
     
	   /*START BLOCK FOR VALUE NOISE*/
	   /*/
	   alt1 &= $FFFF;
	   alt2 &= $FFFF;
	   alt3 &= $FFFF;
	   alt4 &= $FFFF;
	   //*/
	   /*END BLOCK FOR VALUE NOISE*/
     
     
	   /*START BLOCK FOR LINEAR INTERPOLATION*/
	   //BiLinear interpolation
	   /*/
	   var f24=(bX*bY)>>8;
	   var f23=bX-f24;
	   var f14=bY-f24;
	   var f13=256-f14-f23-f24;
	   var val=(alt1*f13+alt2*f23+alt3*f14+alt4*f24);
	   //*/
	   /*END BLOCK FOR LINEAR INTERPOLATION*/
     
     
     
	   //BiCubic interpolation ( in the form alt(bX) = alt[n] - (3*bX^2 - 2*bX^3) * (alt[n] - alt[n+1]) )
	   /*START BLOCK FOR BICUBIC INTERPOLATION*/
	   //*/
	   var bX2=(bX*bX)>>8;
	   var bX3=(bX2*bX)>>8;
	   var _3bX2=3*bX2;
	   var _2bX3=2*bX3;
	   var alt12= alt1 - (((_3bX2 - _2bX3) * (alt1-alt2)) >> 8);
	   var alt34= alt3 - (((_3bX2 - _2bX3) * (alt3-alt4)) >> 8);
     
     
	   var bY2=(bY*bY)>>8;
	   var bY3=(bY2*bY)>>8;
	   var _3bY2=3*bY2;
	   var _2bY3=2*bY3;
	   var val= alt12 - (((_3bY2 - _2bY3) * (alt12-alt34)) >> 8);
     
	   val*=256;
	   //*/
	   /*END BLOCK FOR BICUBIC INTERPOLATION*/
     
     
	   //Accumulate in result
	   result+=(val<<octave);
     
	   octave--;
	   sx = sx << 1;
	   sy = sy << 1;
     
	}
	result = result >> (16+nbOctave+1);
	
	return result;
}