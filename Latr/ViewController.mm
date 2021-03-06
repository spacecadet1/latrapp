//
//  ViewController.m
//  Latr
//
//  Created by Amyth on 1/24/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    pandocLocation = @"/usr/local/bin/";
    latexdiffLocation =@"/Library/TeX/texbin/";
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


- (IBAction)onPandocRun:(id)sender {
    //pandocInterface.getStrCommand().c_str()
    
    pandocInterface.executePandoc([pandocLocation cStringUsingEncoding:NSASCIIStringEncoding]);
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Pandoc Conversion Completed."];
    [alert runModal];
    
}

- (IBAction)openSource:(id)sender{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"tex"]];
    [panel setCanChooseDirectories:NO];
    
    //[panel runModal];
    
    
    if ([panel runModal] == NSModalResponseOK){
        
        NSString *selectedFileName = [[panel URL] path];
        
        pandocInterface.setSource([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        
       // pandocInterface.setDirectory([primary_directory cStringUsingEncoding:NSASCIIStringEncoding]);
        
        latexdiffInterface.setSource([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        
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
            latexdiffInterface.setOutput([[panel URL].path cStringUsingEncoding:NSASCIIStringEncoding]);
            
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

- (IBAction)openPrevious:(id)sender {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"tex"]];
    [panel setCanChooseDirectories:NO];
    
    if ([panel runModal] == NSModalResponseOK){
        NSString *selectedFileName = [panel URL].path;
        latexdiffInterface.setPrevious([selectedFileName cStringUsingEncoding:NSASCIIStringEncoding]);
        _lblPrevious.stringValue = [panel URL].path;
    }
}

- (IBAction)onLatexDiffRun:(id)sender {
    
    latexdiffInterface.executeLatexDiff([latexdiffLocation cStringUsingEncoding:NSASCIIStringEncoding]);
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"LatexDiff Completed."];
    [alert runModal];
    
}
@end
