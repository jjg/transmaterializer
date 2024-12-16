/*

A self-contained media player and archive device with the goal
of being printable on the common Ender 3 printer.

Ender 3 build volume: 220x220x250

Optical drive: 129x128x13mm (~145mm long with cable connector)
Hard disk drive: 100x68x10mm (150 long with cable)
SBC: 90x57x20 (90 wide with power cable)

*/

module ODD(t=0){
    cube([129+t,128+t,13+t]);
}

module HDD(t=0){
    cube([100+t,68+t,10+t]);
}

module SBC(t=0){
    cube([90+t,57+t,20+t]);
}

difference(){
    
    // main chassis
    difference(){
        union(){
            
            // base
            cube([200,200,5]);
            
            // ODD & HDD pockets
            //(ODD dim + wall + wall + tolerance)
            cube([128+5+5+2,125,25+13+5+5]);
        }
        
        // cut-out space for ODD, HDD, SBC
        translate([5,0,5]){
            translate([0,0,25]){
                ODD(1);
            }

            translate([0,200-72,3]){
                rotate([0,0,-90]){
                    HDD(2);
                }
            }
            
            translate([200-120,200-70,0]){
                rotate([0,0,-90]){
                    color("green")
                    SBC(2);
                }
            }
            
            // cut-out for control panel (needs work)
            cube([130,47,20]);
        }
        
        // skeletonize for ventilation, material savings
        translate([15,15,-5]){
            for(y=[0:4]){
                for(x = [0:5]) {
                    translate([x*22,y*22,0]){
                        cylinder(r=10,h=100);
                    }
                }
            }
        }
    }

    
    // cross-sections
    /*
    translate([0,0,0]){
        #cube([200,47,100]);
    }
    */
    translate([0,130,0]){
        #cube([200,200,100]);
    }
    
}

// assemble!
/*
translate([5,0,5]){
    translate([0,0,25]){
        color("blue")
        ODD();
    }

    translate([0,200-72,3]){
        rotate([0,0,-90]){
            color("orange")
            HDD();
        }
    }

    translate([200-100,200-60,0]){
        rotate([0,0,0]){
            color("green")
            SBC();
        }
    }
}
*/