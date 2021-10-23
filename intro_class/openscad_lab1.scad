tgtDetail = 180;


//cylinder(r=10,h=20,$fn=tgtDetail);

/*
for (i = [1:5]) {
    translate([ i * 40, 0, 0]) 
    scale([1, 1, i/5]) 
    cylinder(r=10,h=20,$fn=tgtDetail);
}
*/


dimensions = [17.91, 19.05, 21.21, 24.26, 30.61];
difference() {
    translate([85,0,0]) 
        cube([190,40,10],center=true);

    for (i = [0:5]) { 
        translate([i*40, 
                   dimensions[i]/2 - 20, 
                   0])
            cylinder(d=dimensions[i], 
                     h=30, 
                     center=true);
        } 
}

/*
module ring(outerR, innerR, tgtHeight) {
    difference() {
        cylinder(r=outerR, 
                 h=tgtHeight,
                 $fn=tgtDetail,
                 center=true);
        cylinder(r=innerR, 
                 h=tgtHeight+2,
                 $fn=tgtDetail,
                 center=true);
    }
}


ring(20, 16.5, 40);



color([0.25,0.25,1]) 
    translate([8,10,0]) 
    ring(20,16.5,40);

color([1,0.5,0.25]) 
    translate([8,10,0]) 
    ring(13.5,10,50);
*/
/*
intersection() {
    scale([30,30,30])
	cylinder (h=4, r=1, center=true, $fn=100);
    
    scale([30,30,30])
	rotate ([90,0,0]) 
    cylinder (h=4, r=0.9, center=true, $fn=100);
}
*/

/*

    for (j = [0:6]) {
        translate([i*30,j*30,0])
        scale([1,1,i+(j/6)])
        cylinder(r=10,h=20,$fn=tgtDetail);
    }
}
*/
/*


difference() {

    translate([85,0,0]) 
        cube([190,40,10],center=true);

    for (i = [0:5]){ 
        translate([i*40, 
                   dimensions[i]/2 - 20, 
                   0])
            cylinder(d=dimensions[i], 
                     h=30, 
                     center=true);
        }  
}
*/
/*
outerR = 10;
innerR = 5;
tgtHeight=10;
*/

/*

*/

             
             
//difference() {

//}


/*


*/
/*

     translate([i*50,0,0])
     scale([i*0.5+1,i*0.5+1,i*0.5+1])
        cylinder(r=20, h=30, $fn=tgtDetail, center=true);
}*/

/*
dimensions = [17.91,19.05,21.21,24.26,30.61];

*/
//cylinder(r=10, h=30, $fn=tgtDetail, center=true);
//translate([100,0,0]) rotate([10,20,30]) cube([caseX,caseY,caseZ],center=true);


/*

color([1,0.25,0.25]) translate([10,45,0]) ring(10,6.5,50);

//

//slide
color([0.25,0.25,1]) translate([8,10,0]) ring(20,16.5,50);
color([0.5,0.5,1]) translate([8,10,0]) ring(13.5,10,50);

*/
/*
//cover

*/
/*
intersection() {
	cylinder (h = 4, r=1, center = true, $fn=100);
	rotate ([90,0,0]) cylinder (h = 4, r=0.9, center = true, $fn=100);
}
*/