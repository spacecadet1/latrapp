//
//  LatexDiffInferface.cpp
//  Latr
//
//  Created by John Redcorn on 1/23/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#include "LatexDiffInferface.hpp"


LatexDiffInterface::LatexDiffInterface(){
    
}

void LatexDiffInterface::executeLatexDiff(){
    
    std::string strCommand = "latexdiff ";
    
    strCommand+= source + " " + previous + " > " + output;
    
    system(strCommand.c_str());
}
