include <gears.scad>



tgtdetail = 90;
module filled_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0, optimized = true) {
    union() {
        spur_gear(modul, tooth_number, width, bore, pressure_angle, helix_angle, optimized);
        //translate([0,0,width/2])
        //color([1,0,0])
        //cylinder(r=bore+1,h=width,center=true,$fn=tgtdetail);
    }
}

module stacked_gears() {
    union() {
    filled_gear(modul=1, tooth_number=20, width=8, bore=2, pressure_angle=20, helix_angle=0, optimized=false);
    translate([0,0,-5])
        filled_gear(modul=1, tooth_number=50, width=5, bore=2, pressure_angle=20, helix_angle=0, optimized=false);
    }
}
//filled_gear(modul=1, tooth_number=50, width=5, bore=2, pressure_angle=20, helix_angle=0, optimized=false);
        
stacked_gears();
translate([-27,0,0])
stacked_gears();
