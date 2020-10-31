/* [General] */
// level of detail
fn = 90;
// distance between spool and case
gap_distance = 6;
// thickness of case walls
wall_size = 4;
// thickness of spool model
spool_thickness = 3;
// diameter for stick holding actual spool
spool_holder_diameter = 10;

screw_diameter = 3.5;
module generateSpool(outer_diameter,inner_diameter,width) {
    difference() {   
        union() {
            translate([-1*(width/2)+1.5,0,0]) rotate([0,90,0])  
                cylinder(h=spool_thickness,d=outer_diameter,$fn=fn,center=true);
            
            rotate([0,90,0])
                cylinder(h=width,d=inner_diameter + spool_thickness,$fn=fn,center=true);
           
            translate([(width/2)-1.5,0,0]) rotate([0,90,0])  
                cylinder(h=spool_thickness,d=outer_diameter,$fn=fn,center=true);
            
        }
        
        rotate([0,90,0])
           cylinder(h=width+6,d=inner_diameter,$fn=fn,center=true);
    }
    
}

module createBox(outer_diameter,inner_diameter,width) {
    
    union() {
    //back wall
    translate([0,0.5*outer_diameter+gap_distance+wall_size/2,-1*spool_holder_diameter])
        cube([width+2*(gap_distance+wall_size),wall_size,outer_diameter+(2*gap_distance)+(2*wall_size)+spool_holder_diameter],center=true);
    
    //bottom wall
    translate([0,0,(outer_diameter/-2)-(gap_distance)-(0.5*wall_size)-spool_holder_diameter*1.5])
        cube([width+2*(gap_distance+wall_size),outer_diameter+2*(gap_distance+wall_size),wall_size],center=true);
    
    //left wall
    wall_offset = width/2 + wall_size + gap_distance;
    translate([-1*wall_offset,0,spool_holder_diameter*-0.5])
      wall(outer_diameter,inner_diameter,width);
    //right wall
    
       
        translate([wall_offset,0,spool_holder_diameter*-0.5])  
        mirror([1,0,0])
            wall(outer_diameter,inner_diameter,width);
       
        
    }
    
   
    
}

module wall(outer_diameter,inner_diameter,width) {
    difference() {
        translate([0,0,spool_holder_diameter*-0.5])
            cube([wall_size*2,outer_diameter+2*(gap_distance+wall_size),outer_diameter+(2*gap_distance)+(2*wall_size)+spool_holder_diameter],center=true);
        translate([2,0,spool_holder_diameter*-1]) 
            rotate([0,90,0])
                cylinder(h=6,d=spool_holder_diameter,$fn=fn,center=true);
        translate([2,0,spool_holder_diameter*-0.25])
            cube([6,inner_diameter/2,spool_holder_diameter*1.25],center=true);
        translate([2,outer_diameter/-2,outer_diameter/2])
            rotate([45,0,0])
                cube([6,inner_diameter*0.6,outer_diameter*3/2],center=true);

    }
            

}

module spoolCaseWithLink(outer_diameter,inner_diameter,width) {
   
    difference() {
    translate([0,outer_diameter/-2,outer_diameter/2])
        createBox(outer_diameter,inner_diameter,width);
    translate([0,-10,-5])
        cylinder(h=50,d=screw_diameter,$fn=fn,center=true);
        
    translate([0,-3*outer_diameter/4,-5])
        cylinder(h=50,d=screw_diameter,$fn=fn,center=true);
        
    }
}
translate([100,0,0])
spoolCaseWithLink(49,20,38);
spoolCaseWithLink(39,25,20);

translate([-100,0,0])
spoolCaseWithLink(128,20,58);
