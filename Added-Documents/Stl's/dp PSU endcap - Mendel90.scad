// Cover for 12V DC 30A 360W Regulated Switching Power Supply
// Mendel90 variant
//
// GNU GPL v2
// David Price 2016
//
// 141226 DP Changes to strengthen indent and enable plug clip to engage
// 160105 DP changes for Mendel90 version with socket on side rather than top
//
$fn=360;

width=112;
depth=60;
height=50;

termHeight=10;
termDepth=18;

metalThickness=1;
screwThick=3;

wall=2;

plugWidth=47;
plugHeight=27.5;
plugOffset=4;

rotate([90,0,0])
difference(){
union(){

//shell with side indents
translate([0,(depth-termDepth)/2-depth/2,0])
cube([width,depth-termDepth,height], center=true);

// indented part
cube([width-metalThickness*2,depth,height], center=true);
}

//hollow out
translate([0,wall,0])
cube([width-wall*2-metalThickness*2,depth,height-wall*2], center=true);

//terminal block cut out
translate([0,depth/2-termDepth/2,(termHeight-height)/2])
cube([width,termDepth,termHeight], center=true);

//screw holes
translate([width/2, depth/2-termDepth+7],4) rotate ([0,90,0])
cylinder(r=1.4, h=20, center=true);
translate([-width/2, depth/2-termDepth+7],4) rotate ([0,90,0])
cylinder(r=1.4, h=20, center=true);

// Mendel90 version

// IEC plug hole
translate([width/4-2,-10,height/2]){
// plug hole
cube([plugWidth,plugHeight,3*wall], center=true);
// plug clip flange
//#cube([plugWidth,plugHeight+4,wall-1], center=true);
}
//cable hole
translate([-width/2,-depth/4,10])
cube([10,6,15], center=true);
}

// screw reinforcements
difference() {
translate([(width/2)-4, 0,depth/2-termDepth+7]) rotate ([0,90,0])
cylinder(r=3, h=4, center=true);

translate([(width/2)-4, 0,depth/2-termDepth+7]) rotate ([0,90,0])
cylinder(r=1.4, h=10, center=true);    
}

difference() {
#translate([(-width/2)+4, 0, depth/2-termDepth+7]) rotate ([0,90,0])
cylinder(r=3, h=4, center=true);
  
translate([(-width/2)+4.9, 0, depth/2-termDepth+7]) rotate ([0,90,0])
cylinder(r=1.4, h=10, center=true);   
}
