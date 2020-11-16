zheight = 0.3; //height of the line drawn, ideally 0.1mm less than layer height?
width = 0.45; //modify so CURA renders as just one line draw

SPIRAL_LENGTH = 30;

CYCLE_COUNT = 20; // modify so spiral fits print bed
tgtdetail = 90;
module calibration_spiral() {
	for(i=[0:CYCLE_COUNT]) {
		union() {
			CUR_LOOP = ((i - (i%4))/4) + 1;

			if(i%4==0) {
				translate([SPIRAL_LENGTH*CUR_LOOP/2,-1*SPIRAL_LENGTH*(CUR_LOOP-1),0])
				cube([SPIRAL_LENGTH*CUR_LOOP+(width),width,zheight],center=true);
			}
			else if(i%4==1) {
				
				if(i==1) {
					Y_OFFSET = SPIRAL_LENGTH/2;
				
					translate([SPIRAL_LENGTH*CUR_LOOP,Y_OFFSET,0])
						cube([width,SPIRAL_LENGTH*CUR_LOOP+width,zheight],center=true);
				} else {
					Y_OFFSET = SPIRAL_LENGTH/2;
					translate([SPIRAL_LENGTH*CUR_LOOP,Y_OFFSET,0])
						cube([width,SPIRAL_LENGTH*CUR_LOOP + (SPIRAL_LENGTH*(CUR_LOOP-1))+width,zheight],center=true);
				}
			}
			else if(i%4==2) {
				translate([0,CUR_LOOP*SPIRAL_LENGTH,0])
					cube([SPIRAL_LENGTH*CUR_LOOP*2,width,zheight],center=true);
				
			}
			else if(i%4==3) {
				Y_OFFSET = 0;//SPIRAL_LENGTH*CUR_LOOP/2;
				
				translate([-1*SPIRAL_LENGTH*CUR_LOOP,Y_OFFSET,0])
					cube([width,SPIRAL_LENGTH*(CUR_LOOP+1) + (SPIRAL_LENGTH*(CUR_LOOP-1))+width,zheight],center=true);
				
				//finishing bottom row
				translate([SPIRAL_LENGTH*CUR_LOOP/-2,-1*SPIRAL_LENGTH*(CUR_LOOP),0])
					cube([SPIRAL_LENGTH*CUR_LOOP,width,zheight],center=true);
			}		
		}
	}

}

module overhang(intervals) {
    for(i=[1:6]) {
        translate([0,i*3,0])
        union() {
            translate([0,0,-1.4]) 
                cube([6+(i*intervals),2,0.2],center=true);
            difference() {
                cube([6+(i*intervals),2,3],center=true);
                translate([0,0,-2])
                    cube([4 + (i*2),3,4],center=true);
            }
        }
    }


}

overhang(2);