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


std::string LatexDiffInterface::getSource(){
    
    return source;
    
}
std::string LatexDiffInterface::getOutput(){
    
    return output;
    
}
std::string LatexDiffInterface::getPrevious(){
    
    return previous;
    
}

void LatexDiffInterface::setSource(const char* sourceFile){
    source = sourceFile;
}
void LatexDiffInterface::setOutput(const char* outputFile){
    output = outputFile;
}
void LatexDiffInterface::setPrevious(const char* previousFile){
    previous = previousFile;
}

void LatexDiffInterface::executeLatexDiff(const char* latexdiff_location){
    
    std::cout<<"executing latexdiff.."<<std::endl;
    
    std::string strPreCmd = latexdiff_location;
    
    std::string strCommand = strPreCmd +"latexdiff '";
    
    strCommand+= source + "' '" + previous + "' > '" + output +"'";
    
    std::cout<<strCommand<<std::endl;
    
    system(strCommand.c_str());
}
