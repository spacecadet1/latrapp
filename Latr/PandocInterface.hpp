//
//  PandocInterface.hpp
//  Latr
//
//  Created by John Redcorn on 1/23/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#ifndef PandocInterface_hpp
#define PandocInterface_hpp

#include <stdlib.h>
#include <stdio.h>
#include <string>

#include <cstdio>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <array>
#include <unistd.h>

class PandocInterface{
    std::string source;
    std::string output;
    std::string bib;
    std::string style_location;
    std::string primary_directory;
public:
    PandocInterface();
    
    void setDirectory(const char* directory);
    std::string getPrimaryDirectory();
    
    void setSource(const char* sourceFile);
    std::string getSource();
    
    void setOutput(const char* outputFile);
    std::string getOutput();
    
    void setBib(const char* bibFile);
    std::string getBib();
    
    void setStyleLocation(const char* styleFile);
    std::string getStyleLocation();
    
    bool executePandoc(const char* pandocLocation);
    
    std::string getStrCommand();
    
private:
    //std::string exec(const char* cmd);
    
};
#endif /* PandocInterface_hpp */


