include <gears.scad>



tgtdetail = 90;
TGTMODUL = 1;
pressure_angle = 30;

tgtbore = 6.27;
module filled_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0, optimized = true) {
    union() {
        spur_gear(modul, tooth_number, width, bore, pressure_angle, helix_angle, optimized);
        //translate([0,0,width/2])
        //color([1,0,0])
        //cylinder(r=bore+1,h=width,center=true,$fn=tgtdetail);
    }
}

module stacked_gears(inner_tooth,outer_tooth,bore) {
    union() {
    filled_gear(modul=TGTMODUL, tooth_number=inner_tooth, width=8, bore=bore, pressure_angle=pressure_angle, helix_angle=0, optimized=false);
    translate([0,0,-5])
        filled_gear(modul=TGTMODUL, tooth_number=outer_tooth, width=5, bore=bore, pressure_angle=pressure_angle, helix_angle=0, optimized=false);
    }
}

module weight_spool(bore){
    //color([0,0,1])
    //cylinder(d=bore,h=60,center=true,$fn=tgtdetail);
    curheight = 30;
 
    difference() {
        union() {
            cylinder(d=20,h=curheight,center=true,$fn=tgtdetail);
            translate([0,0,curheight/2])
                cylinder(d=50,h=4,center=true,$fn=tgtdetail);

        }
        cylinder(d=bore,h=curheight+10,center=true,$fn=tgtdetail);
        translate([0,0,curheight/2-8])
        rotate([0,90,0])
            cylinder(d=3.5,h=bore*4,center=true,$fn=tgtdetail);
        
        //screw holes
            translate([6,0,curheight/-2])
        cylinder(d=3.1,h=8,center=true,$fn=tgtdetail);

            translate([-6,0,curheight/-2])
        cylinder(d=3.1,h=8,center=true,$fn=tgtdetail);


    }

}


module weight_spool_cap(bore) {
    curheight = 30;
    translate([0,0,-30])
    difference() {
        translate([0,0,0])
            cylinder(d=50,h=4,center=true,$fn=tgtdetail);
        
        cylinder(d=bore,h=curheight+10,center=true,$fn=tgtdetail);
                //screw holes
            translate([6,0,0])
        cylinder(d=3.1,h=8,center=true,$fn=tgtdetail);

            translate([-6,0,0])
        cylinder(d=3.1,h=8,center=true,$fn=tgtdetail);
        
    }
}
//filled_gear(modul=1, tooth_number=50, width=5, bore=2, pressure_angle=20, helix_angle=0, optimized=false);
       
translate([0,0,-60])
weight_spool(tgtbore);
translate([0,0,-60])
weight_spool_cap(tgtbore);
stacked_gears(20,80,tgtbore);

color([1,0,0])
translate([-48.5,0,2])
rotate([0,0,34])
mirror([0,0,1])
stacked_gears(16,60,tgtbore);

//last gear for motor

translate([-91.5,0,0])
rotate([0,0,25])
color([0,1,0])
stacked_gears(26,60,6.27);
