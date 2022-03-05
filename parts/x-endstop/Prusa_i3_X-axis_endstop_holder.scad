//-- Prusa i3 X-axis Makerbot-style endstop holder
//-- by AndrewBCN - Barcelona, Spain - December 2014
//-- Remix from i3 X Endstop Mount for Sainsmart endstops
//-- by Abby Jones, thing #491859
//-- Note that there are various similar designs on
//-- Thingiverse, so it's difficult to provide proper
//-- attribution. Oh well, I do what I can...
//-- GPLV3

//-- import test
//-- needs the file http://www.thingiverse.com/download:491859

$fn=32;

//-- Modules

module xeh() {
  // part imported, rotated (for comparison)
  rotate([0,0,0]) translate([0,38,0]) import("i3xend.stl");
}

module i3endhold1() {
  // base shape
  translate([10+1.5,0,0]) cube([4,59,5]); 
  translate([10+4.5+6,7,0]) cylinder(r=5.6,h=5);
  translate([10+4.5+6,45+7,0]) cylinder(r=5.6,h=5);
}
module i3endhold2() {
  // beautify (takes a minute or so to calculate)
  minkowski() {
    i3endhold1();
    sphere(r=1, $fn=16);
  }
}
module i3endhold3() {
  difference() { 
    i3endhold2();
    // holes and cutouts
    translate([10+4.5+6,7,-1]) cylinder(r=4,h=20);
    translate([10+4.5+6,45+7,-1]) cylinder(r=4,h=20);
    translate([10+4.5+13,7,4]) cube([15,6.7,10],center=true); 
    translate([10+4.5+13,45+7,4]) cube([15,6.7,10],center=true); 
    translate([10+4.5+13+5.5,32,4]) cube([15,65,10],center=true);
    // slot for mechanical endstop
    translate([10+3,28,3.9]) cube([1.7,39.8,4.8],center=true); 
    translate([10,42,5]) cube([6,10.5,4.8],center=true);
    // slot for belt, around 1.5mm
    translate([10+1.5+4+1,29.5,0]) cube([3,20,12],center=true); 
  }
}
//-- Print the part
// xeh();
i3endhold3();