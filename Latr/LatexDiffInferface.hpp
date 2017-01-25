//
//  LatexDiffInferface.hpp
//  Latr
//
//  Created by John Redcorn on 1/23/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#ifndef LatexDiffInferface_hpp
#define LatexDiffInferface_hpp

#include <stdlib.h>
#include <stdio.h>
#include <string>

class LatexDiffInterface{
    
    std::string source;
    std::string output;
    std::string previous;
public:
    LatexDiffInterface();
    
    
    
    void executeLatexDiff();
    
};


#endif /* LatexDiffInferface_hpp */


