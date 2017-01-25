//
//  PandocInterface.cpp
//  Latr
//
//  Created by John Redcorn on 1/23/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#include "PandocInterface.hpp"


PandocInterface::PandocInterface(){
    
}

void PandocInterface::setSource(const char* sourceFile){
    source = sourceFile;
}

std::string PandocInterface::getSource(){
    return source;
}

void PandocInterface::setOutput(const char* outputFile){
    output = outputFile;
}

std::string PandocInterface::getOutput(){
    return output;
}

void PandocInterface::setBib(const char* bibFile){
    bib = bibFile;
}
std::string PandocInterface::getBib(){
    return bib;
}

void PandocInterface::setStyleLocation(const char* styleFile){
    style_location = styleFile;
}

std::string PandocInterface::getStyleLocation(){
    return style_location;
}

bool PandocInterface::executePandoc(const char* pandocLocation){
    
    //Assume that source and output is populated
    
    //http://stackoverflow.com/questions/21105171/system-function-not-working-c
    
    
    std::cout<<"executing Pandoc.."<<std::endl;
    
    std::string preCommand = pandocLocation;
    std::string strCommand = preCommand+"pandoc -s '";
    strCommand +=  source + "' ";
    
    if(bib.size()>0){
        strCommand += "--bibliography='" + bib + "' ";
        
        if(this->style_location.size()>0){
            strCommand += "--filter  "+preCommand+"pandoc-citeproc --csl='" + style_location +"' ";
        }
    }
    
    strCommand+= "-o '" + output +"'";
    
    std::cout<<strCommand.c_str()<<std::endl;
    
    //strCommand = preCommand+strCommand;
    system(strCommand.c_str());
    /*if(system(strCommand.c_str()) != -1){
        return true;
    }
    else{
        return false;
    }*/
    /*int pid = fork();
    if (pid!=0) {
        //execlp ("ls", "ls", "-l", (char *)0);
        //execlp(strCommand.c_str(), strCommand.c_str(),NULL);
        //execlp(strCommand.c_str());
        //execl(strCommand.c_str());
        //execl("pandoc","pandoc",strCommand.c_str(),(char*) NULL);
    }*/
    
    //execl("pandoc","pandoc",strCommand.c_str(),(char*) NULL);
    
    //execl(strCommand.c_str());
    //execl(strCommand.c_str());
    //execlp ("ls", "ls", "-l", (char *)0);
    return true;
}

std::string PandocInterface::getStrCommand(){
    std::string strCommand = "pandoc -s ";
    strCommand += source + " ";
    
    if(bib.size()>0){
        strCommand += "--bibliography=" + bib + " ";
        
        if(this->style_location.size()>0){
            strCommand += "--filter  pandoc-citeproc --csl=" + style_location +" ";
        }
    }
    
    strCommand+= "-o " + output;
    
    return strCommand;
    
}

/*std::string PandocInterface::exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::shared_ptr<FILE> pipe(popen(cmd, "r"), pclose);
    if (!pipe) throw std::runtime_error("popen() failed!");
    while (!feof(pipe.get())) {
        if (fgets(buffer.data(), 128, pipe.get()) != NULL)
            result += buffer.data();
    }
    return result;
}*/
