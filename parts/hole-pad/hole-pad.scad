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

module hole_pad(height, radius) {
    difference()
    {
        cylinder(h = height, r = radius, $fn = 60);

        // M3 bolt hole
        translate(v = [0, 0, -1]) cylinder(h = height+2, r = 1.65, $fn = 50);
    }
}

// For 606-2RS bearing
// Bearing width is actually 6mm but we are using
// it at places where we have space of 9.4+mm
// hole_pad(8.5, 3);

// For GT2 20 teeth idler pulley
hole_pad(9, 2.5);
