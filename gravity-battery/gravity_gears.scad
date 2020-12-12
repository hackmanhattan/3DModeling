include <gears.scad>



tgtdetail = 90;
TGTMODUL = 1;
pressure_angle = 30;

tgtbore = 6.6;
axis_list = [0,-50.5,-94];
bearing_outer_diameter = 22.25;

m3_dia = 3.1;
module test_bore(tgtbore) {
    difference() {
        cylinder(d=tgtbore+8, h=6,$fn=tgtdetail,center=true);
        cylinder(d=tgtbore,h=8,$fn=tgtdetail,center=true);
    }
}
module filled_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0, optimized = true) {
    union() {
        spur_gear(modul, tooth_number, width, bore, pressure_angle, helix_angle, optimized);
        //translate([0,0,width/2])
        //color([1,0,0])
        //cylinder(r=bore+1,h=width,center=true,$fn=tgtdetail);
    }
}

module stacked_gears(inner_tooth,outer_tooth,bore_a,bore_b) {
    union() {
    filled_gear(modul=TGTMODUL, tooth_number=inner_tooth, width=17, bore=bore_a, pressure_angle=pressure_angle, helix_angle=0, optimized=false);
    translate([0,0,-5])
        filled_gear(modul=TGTMODUL, tooth_number=outer_tooth, width=5, bore=bore_a, pressure_angle=pressure_angle, helix_angle=0, optimized=false);
        difference() {
            translate([0,0,14])
                cylinder(d=bore_a+8,h=35,center=true,$fn=tgtdetail);
            //top hole
            translate([0,0,8])
            cylinder(d=bore_a,h=50,center=true,$fn=tgtdetail);
            translate([0,0,-4])
            cylinder(d=bore_b,h=50,center=true,$fn=tgtdetail);
            translate([0,5,24])
                rotate([90,0,0])
                    cylinder(d=3,h=10,center=true,$fn=tgtdetail);
     
        }

    }
}

module weight_spool(bore){
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
            cylinder(d=m3_dia,h=bore*4,center=true,$fn=tgtdetail);
        
        //screw holes
            translate([6,0,curheight/-2])
        cylinder(d=m3_dia,h=8,center=true,$fn=tgtdetail);

            translate([-6,0,curheight/-2])
        cylinder(d=m3_dia,h=8,center=true,$fn=tgtdetail);


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
        cylinder(d=3,h=8,center=true,$fn=tgtdetail);

            translate([-6,0,0])
        cylinder(d=3,h=8,center=true,$fn=tgtdetail);
        
              translate([12,12,0])
        cylinder(d=10,h=8,center=true,$fn=tgtdetail);
        
    }
    

}

module adapter(inner_diameter,outer_diameter) {
    difference() {
        cylinder(d=outer_diameter,h=7,$fn=tgtdetail,center=true);
        cylinder(d=inner_diameter,h=9,$fn=tgtdetail,center=true);
    }
}
//filled_gear(modul=1, tooth_number=50, width=5, bore=2, pressure_angle=20, helix_angle=0, optimized=false);
   

module frame(axis_list,bearing_diameter) {
    frame_width=180;
    translate([0,0,10])
    union() {
        translate([57,0,11])
        difference() {
        
            cube([6,40,30],center=true);
            translate([0,12,4])
                rotate([0,90,0])
        
                cylinder(r=3.35,h=8,center=true,$fn=tgtdetail);
                   
            translate([0,-12,4])
                rotate([0,90,0])
                cylinder(r=3.35,h=8,center=true,$fn=tgtdetail);
        }
        difference() {
        translate([frame_width/-2+60,0,0])
            cube([frame_width,40,8],center=true);
            for(i=[0:2]) {
                translate([axis_list[i],0,0])
                    cylinder(d=bearing_diameter,h=10,center=true);
            }
        }
    }
}
module motor(){
    motor_dia = 20;
    motor_edge = 15;
    intersection() {
    cylinder(d=motor_dia, h=28,center=true,$fn=tgtdetail);
    cube([motor_edge,30,40],center=true);
    }
}
//translate([0,0,40])
//motor();
//translate([0,0,-60])
//weight_spool(tgtbore);
//translate([0,0,-60])
//weight_spool_cap(tgtbore);


//gear A
//stacked_gears(20,80,tgtbore,tgtbore);



/*
color([1,0,0])
translate([-50.5,0,2])
rotate([0,0,27])
mirror([0,0,1])
stacked_gears(20,60,tgtbore,tgtbore);
*/
//last gear for motor


translate([-94,0,0])
rotate([0,0,28])
color([0,1,0])
stacked_gears(26,30,tgtbore,tgtbore);

//adapter(6.35,7.85);

//frame(axis_list,bearing_outer_diameter);
//adapter(tgtbore,7.85);