// Copyright (C) 2022  Bhavin Gandhi
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

module tnut_m8_holder(base_thickness, create_screw_heads)
{
    difference()
    {
        // Main body
        // Nut thickness is 6.6mm
        cylinder(h = base_thickness+3.3, r = 12.5, $fn = 60);

        // Screw holes
        // Actual diameter of screw 2.8mm
        translate(v = [-9.5, 0, -1]) cylinder(h = base_thickness+4.5, r = 1.65+0.1, $fn = 50);
        translate(v = [9.5, 0, -1]) cylinder(h = base_thickness+4.5, r = 1.65+0.1, $fn = 50);

        // Screw heads
        // Actul diameter of screw head 5.5mm
        if (create_screw_heads)
        {
            translate(v = [-9.5, 0, -1]) cylinder(h = base_thickness, r = 2.75+0.2, $fn = 50);
            translate(v = [9.5, 0, -1]) cylinder(h = base_thickness, r = 2.75+0.2, $fn = 50);
        }

        // M8 nut hole
        // https://amesweb.info/Fasteners/Nut/Metric-Hex-Nut-Sizes-Dimensions-Chart.aspx
        // The actual nut e max might slightly differ, I had one with 14.52mm
        rotate([0, 0, 90]) translate(v = [0, 0, base_thickness]) cylinder(h = 4, d = 15, $fn = 6);

        // Threaded M8 rod passthrough
        translate(v = [0, 0, -1]) cylinder(h = base_thickness+4.5, r = 4.5, $fn = 50);
    }
}

// tnut_m8_holder(2.5, true);
