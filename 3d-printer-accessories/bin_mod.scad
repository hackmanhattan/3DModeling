curfn = 90;

top_buckle_r = 3.85 * 0.5;
top_buckle_space = 3;

top_radius = top_buckle_space + top_buckle_r;
echo(top_radius);
snap_width = 30; //actual is 30


top_to_bottom = 18;
bottom_height = 2;
bottom_depth = 8.5;
inner_depth = 4;



module bin_snap() {
    union() {
        difference() {
            cylinder(r = top_radius, h = snap_width, $fn = curfn, center = true);
            translate([-1, 0, 0])
                cylinder(r = top_buckle_r, h = snap_width + 2, $fn = curfn, center = true);
            translate([0, -5, 0])
                cube([top_radius * 3, 10, snap_width * 2], center = true);
        }
        translate([-1*top_buckle_r+top_buckle_space*-0.5-0.5, inner_depth / -2 + 0.1, 0])
            cube([top_radius - top_buckle_r-1, inner_depth, snap_width], center = true);
        //echo(top_radius*0.5+0.5);
        translate([top_buckle_r+top_buckle_space*0.5-0.5, top_to_bottom / -2 + 0.1, 0])
            cube([top_radius - top_buckle_r+1, top_to_bottom, snap_width], center = true);


        translate([-1,top_to_bottom*-1+0.1,0])
            cube([top_radius*2+2, bottom_height, snap_width], center = true);
    }
}

max_width = 175;
max_depth = 185;
max_height = 76;
wall_thickness = 4;
floor_thickness = 2;


module housing_bottom() {

    difference() {
        cube([max_width, max_depth, max_height], center = true);
        translate([0, 0, floor_thickness])
        cube([max_width - wall_thickness, max_depth - wall_thickness, max_height], center = true);
    }
}

module power_jack() {
    power_jack_height = 27.1;
    power_jack_width = 47.04;
    power_jack_hole_offset = 6;
    power_jack_hole_d = 4.5;
    cube([power_jack_width, 30, power_jack_height], center = true);
    translate([0, 0, (power_jack_height / 2) + power_jack_hole_offset])
    rotate([0, 90, 90])
    cylinder(d = power_jack_hole_d, h = 30, center = true, $fn = 90);
    translate([0, 0, (power_jack_height / -2) - power_jack_hole_offset])
    rotate([0, 90, 90])
    cylinder(d = power_jack_hole_d, h = 30, center = true, $fn = 90);
}
module dial_circuit() {
    hole_diameter = 3.7;
    x_diff = 41.53;
    y_diff = 46.43;

    dial_depth = 17;
    dial_diameter = 24;
    screw_height = 20;
    translate([(x_diff + hole_diameter) / 2, (y_diff + hole_diameter) / -2, 0])
    cylinder(d = hole_diameter, h = screw_height, center = true, $fn = 90);
    translate([(x_diff + hole_diameter) / 2, (y_diff + hole_diameter) / 2, 0])
    cylinder(d = hole_diameter, h = screw_height, center = true, $fn = 90);
    translate([(x_diff + hole_diameter) / -2, (y_diff + hole_diameter) / -2, 0])
    cylinder(d = hole_diameter, h = screw_height, center = true, $fn = 90);
    translate([(x_diff + hole_diameter) / -2, (y_diff + hole_diameter) / 2, 0])
    cylinder(d = hole_diameter, h = screw_height, center = true, $fn = 90);
    translate([37, 0, 14])
    rotate([0, 90, 0])
    cylinder(d = dial_diameter, h = dial_depth, center = true);

}
module powersupply() {
    cube([98, 155, 38], center = true);

}

difference() {
housing_bottom();
translate([-50,-80,0])
power_jack();

translate([-50,10,-30])
rotate([0,0,180])
dial_circuit();
translate([35,10,-5])
powersupply();
}


module callipercase() {
    tgtwidth = 245;
    tgtdepth = 85;

}
//callipercase();

module handle() {
    hollow_d = 8;
    tube_d = 12;
    tgtheight = 130;
    difference() {
        cylinder(d = tube_d, h = tgtheight, center = true, $fn = 90);
        cylinder(d = hollow_d, h = tgtheight + 2, center = true, $fn = 90);
    }
}
//bin_snap();

module glass_holder() {
    outward = 55;
    total_height = 200;
    magnet_plate_width = 40;
    union() {
    translate([0,0,total_height/2-5])
        cube([5,6,total_height],center=true);
    //magnet
    translate([0,magnet_plate_width/2,total_height/2])
        cube([5,magnet_plate_width,50],center=true);
    for ( idx = [0 : 3] ){
        translate([outward/2+0.1,0,idx*60])
            cube([55,6,10],center=true);
        translate([outward-2,0,6+(idx*60)])
            cube([4,6,8],center=true);
        translate([12,0,10+(idx*60)])
        cube([4,6,30],center=true);
    }
}
}

//glass_holder();
module strap() {
    strap_r = 3;
    strap_gap = 10;
    strap_edge = 3;
    strap_width = 21;
    difference() {
    union() {
    translate([strap_width/2+strap_edge,0,0])
        cube([strap_edge,strap_gap*2+strap_r*2,strap_r*2],center=true);
    translate([-1*(strap_width/2+strap_edge),0,0])
        cube([strap_edge,strap_gap*2+strap_r*2,strap_r*2],center=true);
    translate([0,strap_gap,0])
        rotate([0,90,0])
        cylinder(center=true,r=strap_r,h=strap_width+strap_edge*2,$fn=90);
    rotate([0,90,0])
        cylinder(center=true,r=strap_r,h=strap_width+strap_edge*2,$fn=90);
    translate([0,-1*strap_gap,0])
        rotate([0,90,0])
        cylinder(center=true,r=strap_r,h=strap_width+strap_edge*2,$fn=90);
    }
    translate([0,0,strap_r*-1])
    cube([50,50,strap_r*2],center=true);
    }
}

//strap();