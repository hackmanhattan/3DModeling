include <gears.scad>

tgtdetail = 90;
TGTMODUL = 1;
pressure_angle = 30;


//main gear
//spur_gear(TGTMODUL, 51, 5, 8, pressure_angle, 0, true);
//cylinder(r=25,h=6,$fn=tgtdetail,center=true);

//motor gear

//motor bor

motor_bore = 2;
spur_gear(TGTMODUL, 24, 5, motor_bore, pressure_angle, 0, true);
//cylinder(r=12.5,h=6,$fn=tgtdetail,center=true);
