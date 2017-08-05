# -*- coding: utf-8 -*-
"""
Script to create a model from an OpenSCAD document

This script requires that either the OpenSCAD executable is in the system path,
or that the OPENSCAD_PATH variable is set.

Get OpenSCAD at http://www.openscad.org/downloads.html

Usage: This script demonstrates how to programatically generate an STL file
from the OpenSCAD source ("model.scad"), while setting geometry creation
variables on the fly. It is intended to be incorporated into a more complete
program for generating a training dataset; this is just an illustration.

See the contents of the OpenSCAD script for explanation of the control variables.

Script by Ben Weiss, 2017, MIT Licensed for all reuse

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

"""

import os
import subprocess

# Path to the OpenSCAD executable
OPENSCAD_PATH = r"D:\Ben\Doc\OpenSCAD\openscad"

# Parameters of the model we want to change. Any OpenSCAD variable can be
# included here
controls = {"PosX":2.5, "PosY":2.5, "HoleDepth":2, "HoleDiam":2, "Face":0}

model_filename = "model.scad"
output_filename = "model.stl"

cmd = [os.path.join(OPENSCAD_PATH, "openscad"), "-o", output_filename]

for key in controls:
    cmd.extend(["-D", "%s=%s" % (key, controls[key])])

cmd.append(model_filename)

subprocess.call(cmd)