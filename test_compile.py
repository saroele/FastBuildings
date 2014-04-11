# -*- coding: utf-8 -*-
"""
This file can be used to test a compilation of a single model:
1. Copy the \FastBuildings folder, the mop file and this script to any directory you like
2. run this script from within a JModelica python session (run test_compile.py)

Created on Sun Dec  1 21:38:30 2013

@author: roel
"""

import sys, os

from pymodelica import compile_fmu
from pymodelica import compile_fmux

from pyfmi import load_fmu 
from pyjmi import CasadiModel



fmu = compile_fmu('FastBuildings.Examples.SingleZone_ArtificialInputs', os.path.join(os.getcwd(), 'FastBuildings', 'package.mo'))
sim = load_fmu(fmu)

#fmux = compile_fmux('GreyBoxBuildings.Parest', 'Zon_A_TAmb-qHeaCoo-1irr-powEleFree.mop', compiler_options = {'extra_lib_dirs':[os.getcwd()]})
#parest = CasadiModel(fmux)

