//
//  ViewController.m
//  Latr
//
//  Created by John Redcorn on 1/24/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    pandocLocation = @"/usr/local/bin/";
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)onPandocRun:(id)sender {
    //pandocInterface.getStrCommand().c_str()
    
    pandocInterface.executePandoc([pandocLocation cStringUsingEncoding:NSASCIIStringEncoding]);
    
}

- (IBAction)openSource:(id)sender{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"tex"]];
    [panel setCanChooseDirectories:NO];
    
    //[panel runModal];
    
    
    if ([panel runModal] == NSModalResponseOK){
        NSString *selectedFileName = [panel URL].path;
       
        pandocInterface.setSource([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        
        //NSLog(@"%s", pandocInterface.getSource().c_str());
        _lblSource.stringValue =[NSString stringWithCString:pandocInterface.getSource().c_str() encoding:[NSString defaultCStringEncoding]];
        
    }
    
    //NSInteger clicked = [panel runModal];
    
}

- (IBAction)outputLocation:(id)sender {
    NSSavePanel *panel = [NSSavePanel savePanel];
    
    [panel setNameFieldStringValue:@"outputfile.docx"];
    [panel beginWithCompletionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            //NSLog(@"%@", [panel URL].path);
            
            pandocInterface.setOutput([[panel URL].path cStringUsingEncoding:NSASCIIStringEncoding]);
            _lblOutput.stringValue =[NSString stringWithCString:pandocInterface.getOutput().c_str() encoding:[NSString defaultCStringEncoding]];
        }
    }];
}

- (IBAction)openBib:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"bib"]];
    [panel setCanChooseDirectories:NO];
    
    if ([panel runModal] == NSModalResponseOK){
        NSString *selectedFileName = [panel URL].path;
        pandocInterface.setBib([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        _lblBib.stringValue= [panel URL].path;
        
    }
}

- (IBAction)openCSL:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"csl"]];
    [panel setCanChooseDirectories:NO];
    
    if ([panel runModal] == NSModalResponseOK){
        NSString *selectedFileName = [panel URL].path;
        pandocInterface.setStyleLocation([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        _lblCSL.stringValue = [panel URL].path;
        
    }
}
@end
