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

join_xyz = 16;
join_diameter = join_xyz/2;
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
        
    //add joining slots
        createJoins(outer_diameter, inner_diameter,width);
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

module createJoins(outer_diameter, inner_diameter,width) {
    y_offset = outer_diameter/2+gap_distance+join_xyz/2+wall_size;//+join_xyz+wall_size;    
    for (i_x = [-1, 1]){
        x_offset = width/2+gap_distance+wall_size;
        z_offset = (outer_diameter/-2)-(gap_distance)-wall_size-spool_holder_diameter*1.5+join_xyz/2;
            for(i_z = [0,join_xyz*2.5]) {

       
            echo(z_offset * i_z,x_offset*i_x,y_offset);
            difference() {
                
                if(i_z==0) {
        color([0,1,0])
            translate([x_offset*i_x,y_offset,z_offset+i_z])
                cube([wall_size*2,join_xyz,join_xyz],center=true);
                } else {
                            color([0,1,0])
            translate([x_offset*i_x,y_offset-join_xyz/2,z_offset+i_z])
                    rotate([45,0,0])
                cube([wall_size*2,join_xyz*1.5,join_xyz*1.5],center=true);
                }
        color([0,1,1])
            translate([x_offset*i_x,y_offset,z_offset+i_z])
                //cube([join_xyz*2,join_xyz,join_xyz/2],center=true);
                rotate([0,90,0])
                cylinder(r=join_xyz/4,h=join_xyz*2,center=true,$fn=fn);
            }
        }
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
   
    //generateSpool(outer_diameter,inner_diameter,width);
    difference() {
    translate([0,outer_diameter/-2,outer_diameter/2])
        createBox(outer_diameter,inner_diameter,width);
    //bottom screw hole 1
    translate([0,-10,-5])
        cylinder(h=50,d=screw_diameter,$fn=fn,center=true);
    //bottom screw hole 2
    translate([0,-3*outer_diameter/4,-5])
        cylinder(h=50,d=screw_diameter,$fn=fn,center=true);
        
    }
}
/*
translate([100,0,0])
spoolCaseWithLink(49,20,38);

spoolCaseWithLink(39,25,20);

translate([-100,0,0])
spoolCaseWithLink(128,20,58);
*/
spoolCaseWithLink(50,21,38);