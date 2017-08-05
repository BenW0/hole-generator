// A quick OpenSCAD script for generating a solid model 
// matching the specification of 
// Learning Localized Geometric Features Using 3D-CNN: An Application to Manufacturability Analysis of Drilled Holes
// by Aditya Balu et. Al. 2016,  	arXiv:1612.02141
//
// Implementation by Ben Weiss, 2017, MIT Licensed
/*

Copyright 2017 Ben Weiss

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the "Software"), to deal 
in the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/

// Define the object size, in inches
width = 5;
height = 5;
depth = 5;

// Define the hole location, in inches. These will be overridden when the script is executed from Python
PosX = 2;
PosY = 1;
HoleDepth = 3;
HoleDiam = 1;
Face = 5;       // 0 thru 5, detemines which face the hole will be on. [X-Z, XY, XZ, X-Y, ZY, -ZY]


// Derived Variables
mm_per_in = 25.4;
eps = 0.05;

rot = [Face < 4 ? Face * 90 - 90 : 0, Face >= 4 ? -90 + 180 * (Face - 4) : 0, 0];
echo(rot=rot);

// Geometry
scale([1, 1, 1] * mm_per_in)
difference()
{
    cube([width, height, depth], center=true);
    rotate(rot)
    translate([-width * 0.5 + PosX, -height * 0.5 + PosY, depth * 0.5])
    cylinder(d=HoleDiam, h=HoleDepth*2 + eps, center=true, $fn=50);
}