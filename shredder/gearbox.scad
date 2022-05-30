use <gears.scad>;
tgtfn = 90;


//rod
//color([1,0,0])
//cylinder(d=22,h=10,center=true,$fn=tgtfn);

module hexcase(tgt_i_radius,tgt_o_radius,tgt_height) {
    difference() {
        cylinder(r=tgt_o_radius,h=tgt_height,$fn=6,center=true);
        translate([0,0,-1])
            cylinder(r=tgt_i_radius,h=tgt_height+4,$fn=tgtfn,center=true);
    }
    
}
union() {
hexcase(40,50,20);
    planetary_gear(modul=1, sun_teeth=30, planet_teeth=30, number_planets=4, width=14, rim_width=3, bore=22, pressure_angle=20, helix_angle=30, together_built=false, optimized=true);

}

//motor
//translate([-25,0,0])
//cube([50,10,5],center=true);